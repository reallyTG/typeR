library(AzureStor)


### Name: create_storage_account
### Title: Create Azure storage account
### Aliases: create_storage_account

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # create a new storage account
##D rg$create_storage_account("mystorage", kind="StorageV2")
##D 
##D # create a blob storage account in a different region
##D rg$create_storage_account("myblobstorage",
##D     location="australiasoutheast",
##D     kind="BlobStorage")
##D 
## End(Not run)



