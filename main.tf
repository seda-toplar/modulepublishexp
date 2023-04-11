terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.88.1"
    }
  }
}


provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.base_name
  location = var.location
}

resource "azurerm_route_table" "example" {
  name                = "acceptanceTestRouteTable1"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_route" "example" {
  name                = "acceptanceTestRoute1"
  resource_group_name = var.base_name
  route_table_name    = azurerm_route_table.example.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "VnetLocal"
}