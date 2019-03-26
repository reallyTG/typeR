library(AzureContainers)


### Name: aks_pools
### Title: Utility function for specifying Kubernetes agent pools
### Aliases: aks_pools

### ** Examples

# 1 pool of 5 Linux VMs
aks_pools("pool1", 5)

# 1 pool of 3 Windows Server VMs
aks_pools("pool1", 3, os="Windows")

# 2 pools with different VM sizes per pool
aks_pools(c("pool1", "pool2"), count=c(3, 3), size=c("Standard_DS2_v2", "Standard_DS3_v2"))




