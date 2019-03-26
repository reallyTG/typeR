library(RHPCBenchmark)


### Name: PamClusteringMicrobenchmark
### Title: Conducts a single performance trial with the cluster::pam
###   function
### Aliases: PamClusteringMicrobenchmark

### ** Examples

## Not run: 
##D # Allocate input to the pam clustering microbenchmark
##D microbenchmarks <- GetClusteringExampleMicrobenchmarks()
##D kernelParameters <- ClusteringAllocator(microbenchmarks[["pam_cluster_3_3_1000"]])
##D # Execute the microbenchmark
##D timings <- PamClusteringMicrobenchmark(
##D    microbenchmarks[["pam_cluster_3_3_1000"]], kernelParameters)
## End(Not run)




