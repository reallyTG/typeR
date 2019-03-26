library(AzureContainers)


### Name: docker_registry
### Title: Docker registry class
### Aliases: docker_registry
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
##D # get the registry endpoint
##D dockerreg <- rg$get_acr("myregistry")$get_docker_registry()
##D 
##D dockerreg$login()
##D dockerreg$list_repositories()
##D 
##D # create an image from a Dockerfile in the current directory
##D call_docker("build -t myimage .")
##D 
##D # push the image
##D dockerreg$push("myimage")
##D 
## End(Not run)



