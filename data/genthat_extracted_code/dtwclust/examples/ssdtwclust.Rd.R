library(dtwclust)


### Name: ssdtwclust
### Title: A shiny app for semi-supervised DTW-based clustering
### Aliases: ssdtwclust

### ** Examples


## Not run: 
##D require(doParallel)
##D workers <- makeCluster(detectCores())
##D clusterEvalQ(workers, {
##D     library(dtwclust)
##D     RcppParallel::setThreadOptions(1L)
##D })
##D registerDoParallel(workers)
##D ssdtwclust(reinterpolate(CharTraj[1L:20L], 150L))
## End(Not run)




