library(RHPCBenchmark)


### Name: ClaraClusteringMicrobenchmark
### Title: Conducts a single performance trial with the cluster::clara
###   function
### Aliases: ClaraClusteringMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the pam clustering microbenchmark
##D microbenchmarks <- GetClusteringExampleMicrobenchmarks()
##D kernelParameters <- ClusteringAllocator(microbenchmarks[["clara_cluster_3_3_1000"]])
##D # Execute the microbenchmark
##D timings <- ClaraClusteringMicrobenchmark(
##D    microbenchmarks[["clara_cluster_3_3_1000"]], kernelParameters)
## End(Not run)




