library(BayesianAnimalTracker)


### Name: dataSim
### Title: Simulate data to mimic the GPS observations and the DR path.
### Aliases: dataSim
### Keywords: simulation

### ** Examples

set.seed(1)
#Generating data from our 
dlist <- dataSim(T=100, K=10, s2H=1, s2D=0.1, betaVec=c(1))
gpsObs <- dlist$Y
gpsTime <- dlist$Ytime
drPath <- dlist$X
wlist <- as.dataList(drPath, gpsObs, gpsTime, timeUnit=1, s2G=0.01, dUnit=1, betaOrder=1)
##Examples continues in function "as.dataList".



