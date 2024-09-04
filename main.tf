provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "ai_rg" {
  name     = "rg-innovative-ai"
  location = var.location
}

resource "azurerm_storage_account" "cosmic_storage" {
  name                     = "cosmicstoracct"
  resource_group_name      = azurerm_resource_group.ai_rg.name
  location                 = azurerm_resource_group.ai_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_cognitive_account" "stellar_openai" {
  name                = "stellaropenai"
  resource_group_name = azurerm_resource_group.ai_rg.name
  location            = azurerm_resource_group.ai_rg.location
  kind                = "OpenAI"
  sku_name            = "S0"
}

resource "azurerm_search_service" "neural_ai_search" {
  name                = "neuralaisearch"
  resource_group_name = azurerm_resource_group.ai_rg.name
  location            = azurerm_resource_group.ai_rg.location
  sku                 = "standard"
  replica_count       = 1
  partition_count     = 1
}
