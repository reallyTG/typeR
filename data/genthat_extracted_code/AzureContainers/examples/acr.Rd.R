library(AzureContainers)


### Name: acr
### Title: Azure Container Registry class
### Aliases: acr az_container_registry
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a registry: via a resource group object
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D myacr <- rg$get_acr("myregistry")
##D 
##D myacr$list_credentials()
##D myacr$list_policies()
##D 
##D # get the registry endpoint
##D dockerreg <- myacr$get_docker_registry()
##D 
## End(Not run)



