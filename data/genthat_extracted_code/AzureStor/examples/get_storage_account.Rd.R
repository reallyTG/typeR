library(AzureStor)


### Name: get_storage_account
### Title: Get existing Azure storage account(s)
### Aliases: get_storage_account list_storage_accounts

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # get a storage account
##D rg$get_storage_account("mystorage")
##D 
## End(Not run)



