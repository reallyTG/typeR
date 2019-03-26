library(recluster)


### Name: recluster.group.col
### Title: Compute mean coordinate values and RGB colours.
### Aliases: recluster.group.col
### Keywords: cluster

### ** Examples

data(datamod)
sordiss<- recluster.dist(datamod,dist="sorensen")
points<-metaMDS(sordiss, center=TRUE)$points
col<-recluster.col(points)
group<-c(1,2,3,3,3,1,2,1,2)
ncol<-recluster.group.col(col,group)
recluster.plot.col(ncol$aggr)



