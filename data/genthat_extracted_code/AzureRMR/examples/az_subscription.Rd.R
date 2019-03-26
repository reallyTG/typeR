library(AzureRMR)


### Name: az_subscription
### Title: Azure subscription class
### Aliases: az_subscription
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way to retrieve a subscription object
##D sub <- az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")
##D 
##D # retrieve list of resource group objects under this subscription
##D sub$list_resource_groups()
##D 
##D # get a resource group
##D sub$get_resource_group("rgname")
##D 
##D # check if a resource group exists, and if not, create it
##D rg_exists <- sub$resource_group_exists("rgname")
##D if(!rg_exists)
##D     sub$create_resource_group("rgname", location="australiaeast")
##D 
##D # delete a resource group
##D sub$delete_resource_group("rgname")
##D 
##D # get provider API versions for some resource types
##D sub$get_provider_api_version("Microsoft.Compute", "virtualMachines")
##D sub$get_provider_api_version("Microsoft.Storage", "storageAccounts")
##D 
## End(Not run)



