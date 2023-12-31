# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "BatmanInc"
  address_space       = ["10.0.0.0/16"]
  location            = "Central US"
  resource_group_name = "1-e167c930-playground-sandbox"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "Batman"
  }
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "Robins"
  resource_group_name  = "1-e167c930-playground-sandbox"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}