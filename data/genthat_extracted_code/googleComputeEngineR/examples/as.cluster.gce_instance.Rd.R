library(googleComputeEngineR)


### Name: as.cluster.gce_instance
### Title: Create a future cluster for GCE objects
### Aliases: as.cluster.gce_instance

### ** Examples

## No test: ## Not run: 
##D vm <- gce_vm("r-base", name = "future", predefined_type = "f1-micro")
##D plan(cluster, workers = vm)  ## equivalent to workers = as.cluster(vm)
##D x %<-% { Sys.getinfo() }
##D print(x)
## End(Not run)## End(No test)




