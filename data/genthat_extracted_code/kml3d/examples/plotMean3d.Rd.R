library(kml3d)


### Name: plotMeans3d,ClusterLongData3d
### Title: ~ Function: plotMeans3d for ClusterLongData3d ~
### Aliases: plotMeans3d plotMeans3d,ClusterLongData3d,numeric-method
### Keywords: package ts aplot

### ** Examples

##################
### Real example on array

time=c(1,2,3,4,8,12,16,20)
id2=1:120
f <- function(id,t)((id-1)%%3-1) * t
g <- function(id,t)(id%%2+1)*t
h <- function(id,t)(id%%4-0.5)*(20-t)
myCld <- clusterLongData3d(array(cbind(outer(id2,time,f),outer(id2,time,g),
   outer(id2,time,h))+rnorm(120*8*3,0,3),dim=c(120,8,3)))
kml3d(myCld,3:4,2)

### Basic plot
plotMeans3d(myCld,3)

### plotMeans3d, variable 1 and 3
plotMeans3d(myCld,4,varZ=3)
plotMeans3d(myCld,3,parTraj=parTRAJ(col="red"))



