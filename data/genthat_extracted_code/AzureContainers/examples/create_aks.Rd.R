library(AzureContainers)


### Name: create_aks
### Title: Create Azure Kubernetes Service (AKS)
### Aliases: create_aks

### ** Examples

## Not run: 
##D 
##D rg <- AzureRMR::az_rm$
##D     new(tenant="myaadtenant.onmicrosoft.com", app="app_id", password="password")$
##D     get_subscription("subscription_id")$
##D     get_resource_group("rgname")
##D 
##D rg$create_aks("mycluster", agent_pools=aks_pools("pool1", 5))
##D 
##D # GPU-enabled cluster
##D rg$create_aks("mygpucluster", agent_pools=aks_pools("pool1", 5, size="Standard_NC6s_v3"))
##D 
## End(Not run)



