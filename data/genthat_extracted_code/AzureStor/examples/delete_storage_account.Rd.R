library(AzureStor)


### Name: delete_storage_account
### Title: Delete an Azure storage account
### Aliases: delete_storage_account

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # delete a storage account
##D rg$delete_storage_account("mystorage")
##D 
## End(Not run)



