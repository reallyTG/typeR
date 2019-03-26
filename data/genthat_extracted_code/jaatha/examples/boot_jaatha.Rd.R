library(jaatha)


### Name: boot_jaatha
### Title: Parametric Bootstrapping of Jaatha Estimates
### Aliases: boot_jaatha

### ** Examples

## Not run: 
##D # The original Jaatha anaylsis:
##D jaatha_result <- jaatha(model, data, cores = 4)
##D 
##D # Bootstrapping the results using 4 CPU cores on host1 and 2 on host2/host3:
##D library(boot)
##D library(snow)
##D cl <- makeSOCKcluster(c("host1", "host1", "host2", "host3"))
##D 
##D jaatha_boot_results <- boot_jaatha(jaatha_result, 200, 
##D                                    cores_per_run = 2,
##D                                    parallel = "snow",
##D                                    cl = cl)
##D 
##D stopCluster(cl)
##D boot.ci(jaatha_boot_results, type = "norm")
## End(Not run)




