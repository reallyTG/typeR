library(AzureContainers)


### Name: aci
### Title: Azure Container Instance class
### Aliases: aci az_container_instance
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a container: via a resource group object
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D myaci <- rg$get_aci("mycontainer")
##D 
##D myaci$stop()
##D myaci$restart()
##D 
## End(Not run)



