library(ParallelLogger)


### Name: makeCluster
### Title: Create a cluster of nodes for parallel computation
### Aliases: makeCluster

### ** Examples

fun <- function(x) {
  return (x^2)
}

cluster <- makeCluster(numberOfThreads = 3)
clusterApply(cluster, 1:10, fun)
stopCluster(cluster)



