library(flexclust)


### Name: bootFlexclust
### Title: Bootstrap Flexclust Algorithms
### Aliases: bootFlexclust bootFlexclust-class show,bootFlexclust-method
###   summary,bootFlexclust-method plot,bootFlexclust,missing-method
###   boxplot,bootFlexclust-method densityplot,bootFlexclust-method
### Keywords: cluster

### ** Examples

## Not run: 
##D 
##D ## data uniform on unit square
##D x <- matrix(runif(400), ncol=2)
##D 
##D cl <- FALSE
##D 
##D ## to run bootstrap replications on a workstation cluster do the following:
##D library("parallel")
##D cl <- makeCluster(2, type = "PSOCK")
##D clusterCall(cl, function() require("flexclust"))
##D 
##D 
##D ## 50 bootstrap replicates for speed in example,
##D ## use more for real applications
##D bcl <- bootFlexclust(x, k=2:7, nboot=50, FUN=cclust, multicore=cl)
##D 
##D bcl
##D summary(bcl)
##D 
##D ## splitting the square into four quadrants should be the most stable
##D ## solution (increase nboot if not)
##D plot(bcl)
##D densityplot(bcl, from=0)
## End(Not run)


