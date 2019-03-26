library(kml)


### Name: plot,ClusterLongData
### Title: ~ Function: plot for ClusterLongData ~
### Aliases: plot plot,ClusterLongData plot,ClusterLongData,ANY-method
###   plot,ClusterLongData,missing-method
###   plot,ClusterLongData,numeric-method
###   plot,ClusterLongData,Partition-method
### Keywords: dplot iplot chron spatial classif cluster ts

### ** Examples

##################
### Construction of the data

ld <- gald()

### Basic plotting
plot(ld)


##################
### Changing graphical parameters 'par'

kml(ld,3:4,1)

### No letters on the mean trajectories
plot(ld,3,parMean=parMEAN(type="l"))

### Only one letter on the mean trajectories
plot(ld,4,parMean=parMEAN(pchPeriod=Inf))

### Color individual according to its clusters (col="clusters")
plot(ld,3,parTraj=parTRAJ(col="clusters"))

### Mean without individual
plot(ld,4,parTraj=parTRAJ(type="n"))


### No mean trajectories (type="n")
### Color individual according to its clusters (col="clusters")
plot(ld,3,parTraj=parTRAJ(col="clusters"),parMean=parMEAN(type="n"))

### Only few trajectories
plot(ld,4,nbSample=10,parTraj=parTRAJ(col='clusters'),parMean=parMEAN(type="n"))




