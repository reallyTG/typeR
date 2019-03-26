library(recluster)


### Name: recluster.col
### Title: Projecting a two dimensional plot in RGB space
### Aliases: recluster.col
### Keywords: plot

### ** Examples

data(datamod)
sordiss<- recluster.dist(datamod,dist="sorensen")
points<-metaMDS(sordiss, center=TRUE)$points
col<-recluster.col(points)
col



