library(AzureContainers)


### Name: delete_aci
### Title: Delete an Azure Container Instance (ACI)
### Aliases: delete_aci

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D rg$delete_aci("mycontainer")
##D 
## End(Not run)



