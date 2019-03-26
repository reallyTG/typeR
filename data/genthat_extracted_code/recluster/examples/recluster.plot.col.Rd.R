library(recluster)


### Name: recluster.plot.col
### Title: Plotting data in RGB space
### Aliases: recluster.plot.col
### Keywords: plot

### ** Examples

data(datamod)
sordiss<- recluster.dist(datamod,dist="sorensen")
points<-metaMDS(sordiss, center=TRUE)$points
col<-recluster.col(points)
recluster.plot.col(col)



