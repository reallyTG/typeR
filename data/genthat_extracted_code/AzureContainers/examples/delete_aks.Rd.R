library(AzureContainers)


### Name: delete_aks
### Title: Delete an Azure Kubernetes Service (AKS)
### Aliases: delete_aks

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D rg$delete_aks("mycluster")
##D 
## End(Not run)



