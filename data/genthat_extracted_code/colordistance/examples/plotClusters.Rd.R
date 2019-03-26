library(colordistance)


### Name: plotClusters
### Title: Plot clusters in 3D color space
### Aliases: plotClusters

### ** Examples

## Not run: 
##D # Takes >10 seconds
##D cluster.list <- colordistance::getHistList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), plotting=FALSE,
##D lower=rep(0.8, 3), upper=rep(1, 3))
##D 
##D colordistance::plotClusters(cluster.list, p=c(1:3, 7:8), pausing=FALSE)
##D 
##D clusterListHSV <- colordistance::getHistList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), hsv=TRUE,
##D plotting=FALSE, lower=rep(0.8, 3), upper=rep(1, 3))
##D 
##D colordistance::plotClusters(clusterListHSV, p=c(1:3, 7:8), hsv=TRUE,
##D pausing=FALSE)
## End(Not run)



