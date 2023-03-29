terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.3.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resourcesgp"
  location = "West Europe"
}
#test
# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-networkgp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

