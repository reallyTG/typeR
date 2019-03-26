library(dclone)


### Name: clusterSize
### Title: Optimizing the number of workers
### Aliases: clusterSize plotClusterSize
### Keywords: utilities

### ** Examples

## determine the number of workers needed
clusterSize(1:5)
## visually compare balancing options
opar <- par(mfrow=c(2, 2))
plotClusterSize(2,1:5, "none")
plotClusterSize(2,1:5, "load")
plotClusterSize(2,1:5, "size")
plotClusterSize(2,1:5, "both")
par(opar)



