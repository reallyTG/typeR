library(AzureContainers)


### Name: delete_acr
### Title: Delete an Azure Container Registry (ACR)
### Aliases: delete_acr

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D rg$delete_acr("myregistry")
##D 
## End(Not run)



