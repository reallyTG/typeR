library(colordistance)


### Name: plotClustersMulti
### Title: Plot several different cluster sets together
### Aliases: plotClustersMulti

### ** Examples


## Not run: 
##D # Takes >10 seconds
##D cluster.list <- colordistance::getHistList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), plotting=FALSE,
##D lower=rep(0.8, 3), upper=rep(1, 3))
##D 
##D colordistance::plotClustersMulti(cluster.list, p=c(1:4), title="Orange and
##D black Heliconius")
##D 
##D colordistance::plotClustersMulti(cluster.list, p=c(5:8), title="Black, yellow,
##D and red Heliconius")
##D 
##D clusterListHSV <- colordistance::getHistList(dir(system.file("extdata",
##D "Heliconius/", package="colordistance"), full.names=TRUE), hsv=TRUE,
##D plotting=FALSE, lower=rep(0.8, 3), upper=rep(1, 3))
##D 
##D colordistance::plotClustersMulti(clusterListHSV, p=c(1:3, 7:8), hsv=TRUE)
## End(Not run)



