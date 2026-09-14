terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "crescendotfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

resource "azurerm_resource_group" "rg" {
  name     = "crescendo-exam-rg"
  location = "East US"
}