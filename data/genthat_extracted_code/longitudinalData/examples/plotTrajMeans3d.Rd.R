library(longitudinalData)


### Name: plotTrajMeans3d,LongData
### Title: ~ Function: plotTrajMeans3d for LongData3d ~
### Aliases: plotTrajMeans3d plotTrajMeans3d,LongData3d
###   plotTrajMeans3d,LongData3d-method
###   plotTrajMeans3d,LongData3d,Partition-method
###   plotTrajMeans3d,LongData3d,missing-method
### Keywords: package ts aplot

### ** Examples


##################
### Construction of the data

## No test: 
time=c(1,2,3,4,8,12,16,20)
id2=1:120
f <- function(id,t)((id-1)%%3-1) * t
g <- function(id,t)(id%%2+1)*t
h <- function(id,t)(id%%4-0.5)*(20-t)
ld <- longData3d(array(cbind(outer(id2,time,f),outer(id2,time,g),outer(id2,time,h))+
   rnorm(120*8*3,0,3),dim=c(120,8,3)))
part <- partition(rep(1:6,20))

### Basic plotting
plotTrajMeans3d(ld)
plotTrajMeans3d(ld,part)

### Variable 1 and 3, then 2 and 3
plotTrajMeans3d(ld,part)
plotTrajMeans3d(ld,part,varY=3,varZ=2)
plotTrajMeans3d(ld,part,varY=1,varZ=3)

##################
### Changing graphical parameters 'par'

### Color individual according to its clusters (col="clusters")
plotTrajMeans3d(ld,part,parTraj=parTRAJ(col="clusters"))
plotTrajMeans3d(ld,part,parTraj=parTRAJ(col="clusters"),varY=1,varZ=3)

### No mean trajectories (type="n"), only few trajectories
### Color individual according to its clusters (col="clusters")
plotTrajMeans3d(ld,part,parTraj=parTRAJ(col="clusters"),parMean=parMEAN(type="n"),nbSample=10)
## End(No test)



