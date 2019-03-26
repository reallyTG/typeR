library(kml3d)


### Name: plot,ClusterLongData3d
### Title: ~ Function: plot for ClusterLongData3d ~
### Aliases: plot plot,ClusterLongData3d plot,ClusterLongData3d,ANY-method
###   plot,ClusterLongData3d,missing-method
###   plot,ClusterLongData3d,numeric-method
### Keywords: dplot iplot chron spatial classif cluster ts

### ** Examples

##################
### Construction of the data

myCld <- gald3d()

### Basic plotting
plot(myCld)

##################
### Changing graphical parameters 'par'

### No letters on the mean trajectories
kml3d(myCld,2:7,2)
plot(myCld,2,parMean=parMEAN(type="l"))

### Only one letter on the mean trajectories
plot(myCld,3,parMean=parMEAN(pchPeriod=Inf))

### Color individual according to its clusters (col="clusters")
plot(myCld,4,parTraj=parTRAJ(col="clusters"))

### Mean without individual
plot(myCld,5,parTraj=parTRAJ(type="n"))


### No mean trajectories (type="n")
### Color individual according to its clusters (col="clusters")
plot(myCld,6,parTraj=parTRAJ(col="clusters"),parMean=parMEAN(type="n"))

### Only few trajectories
plot(myCld,7,nbSample=10,parTraj=parTRAJ(col='clusters'),parMean=parMEAN(type="n"))




