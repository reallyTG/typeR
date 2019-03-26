library(BayesianAnimalTracker)


### Name: BMControl
### Title: Produce a list of arguements controlling 'BMAnimalTrack'
### Aliases: BMControl
### Keywords: control agruments

### ** Examples

set.seed(1)
#Generating data from our 
dlist <- dataSim(T=100, K=10, s2H=1, s2D=0.1, betaVec=c(1))
gpsObs <- dlist$Y
gpsTime <- dlist$Ytime
drPath <- dlist$X
wlist <- as.dataList(drPath, gpsObs, gpsTime, timeUnit=1, s2G=0.01,
          dUnit=1, betaOrder=1)
etaMar <- BMAnimalTrack(wlist, BMControl(print=TRUE))



