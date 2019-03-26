library(longitudinalData)


### Name: plotTrajMeans,LongData
### Title: ~ Function: plotTrajMeans for LongData ~
### Aliases: plotTrajMeans plotTrajMeans,LongData
###   plotTrajMeans,LongData-method plotTrajMeans,LongData,missing-method
###   plotTrajMeans,LongData,Partition-method
### Keywords: package aplot

### ** Examples

##################
### Construction of the data
data(artificialLongData)
ld <- longData(artificialJointLongData)
part <- partition(rep(1:3,each=50))

### Basic plotting
plotTrajMeans(ld)
plotTrajMeans(ld,part,xlab="Time")


##################
### Changing graphical parameters 'par'

### No letters on the mean trajectories
plotTrajMeans(ld,part,parMean=parMEAN(type="l"))

### Only one letter on the mean trajectories
plotTrajMeans(ld,part,parMean=parMEAN(pchPeriod=Inf))

### Color individual according to its clusters (col="clusters")
plotTrajMeans(ld,part,parTraj=parTRAJ(col="clusters"))

### Mean without individual
plotTrajMeans(ld,part,parTraj=parTRAJ(type="n"))


### No mean trajectories (type="n")
### Color individual according to its clusters (col="clusters")
plotTrajMeans(ld,part,parTraj=parTRAJ(col="clusters"),parMean=parMEAN(type="n"))

### Only few trajectories
plotTrajMeans(ld,part,nbSample=10,parTraj=parTRAJ(col='clusters'),parMean=parMEAN(type="n"))


##################
### single variable trajectory

data(artificialLongData)
ld2 <- longData(artificialLongData)
part2 <- partition(rep(1:4,each=50))
plotTrajMeans(ld2)
plotTrajMeans(ld2,part2)



