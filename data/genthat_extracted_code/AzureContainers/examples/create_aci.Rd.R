library(AzureContainers)


### Name: create_aci
### Title: Create Azure Container Instance (ACI)
### Aliases: create_aci

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D # get the ACR resource that contains the image
##D myacr <- rg$get_acr("myregistry")
##D 
##D rg$create_aci("mycontainer",
##D     image_name="myregistry.azurecr.io/myimage:latest",
##D     registry_creds=myacr)
##D 
## End(Not run)



