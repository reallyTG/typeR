library(recluster)


### Name: recluster.plot.sites.col
### Title: Plotting RGB dots on a custom coordinate space
### Aliases: recluster.plot.sites.col
### Keywords: plot

### ** Examples

data(datamod)
sordiss<- recluster.dist(datamod, dist="sorensen")
lat<-c(2,2,2,1,3,1,1,3,3)
long<-c(1,5,3,3,3,1,5,1,5)
points<-metaMDS(sordiss, center=TRUE)$points
col<-recluster.col(points)
recluster.plot.sites.col(long, lat, col,text=TRUE)



