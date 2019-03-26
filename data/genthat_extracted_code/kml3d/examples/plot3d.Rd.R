library(kml3d)


### Name: plot3d,ClusterLongData3d
### Title: ~ Function: plot3d for ClusterLongData3d ~
### Aliases: plot3d plot3d,ClusterLongData3d,missing-method
###   plot3d,ClusterLongData3d,numeric-method
### Keywords: package ts aplot

### ** Examples

## No test: 
##################
### Real example on array

time=c(1,2,3,4,8,12,16,20)
id2=1:120
f <- function(id,t)((id-1)%%3-1) * t
g <- function(id,t)(id%%2+1)*t
h <- function(id,t)(id%%4-0.5)*(20-t)
myCld <- clusterLongData3d(array(cbind(outer(id2,time,f),outer(id2,time,g),
   outer(id2,time,h))+rnorm(120*8*3,0,3),dim=c(120,8,3)))

### Basic plot
plot(myCld,parTraj=parTRAJ(col=rep(1:6,20)))

### plot3d, variable 1 and 2
plot3d(myCld,parTraj=parTRAJ(col=rep(1:6,20)))

### plot3d, variable 1 and 3
plot3d(myCld,parTraj=parTRAJ(col=rep(1:6,20)),varZ=3)
plot3d(myCld,parTraj=parTRAJ(col="red"))
## End(No test)



