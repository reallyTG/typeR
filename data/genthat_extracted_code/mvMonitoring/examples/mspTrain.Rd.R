library(mvMonitoring)


### Name: mspTrain
### Title: Multi-State Adaptive-Dynamic Process Training
### Aliases: mspTrain

### ** Examples


## Not run: 
##D # cut down on R CMD check time
##D 
##D   nrml <- mspProcessData(faults = "NOC")
##D 
##D   mspTrain(data = nrml[, -1],
##D          labelVector = nrml[, 1],
##D          trainObs = 4320)
##D 
## End(Not run)




