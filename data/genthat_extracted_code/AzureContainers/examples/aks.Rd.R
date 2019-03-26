library(AzureContainers)


### Name: aks
### Title: Azure Kubernetes Service class
### Aliases: aks az_kubernetes_service
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D # recommended way of retrieving a cluster: via a resource group object
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D myaks <- rg$get_aks("mycluster")
##D 
##D # sync with Azure: AKS resource creation can take a long time, use this to track status
##D myaks$sync_fields()
##D 
##D # get the cluster endpoint
##D kubclus <- myaks$get_cluster()
##D 
## End(Not run)



