library(mvMonitoring)


### Name: mspMonitor
### Title: Real-Time Process Monitoring Function
### Aliases: mspMonitor

### ** Examples


## Not run: 
##D # cut down on R CMD check time
##D 
##D   nrml <- mspProcessData(faults = "NOC")
##D   n <- nrow(nrml)
##D 
##D   # Calculate the training summary, but save five observations for monitoring.
##D   trainResults_ls <- mspTrain(data = nrml[1:(n - 5), -1],
##D                               labelVector = nrml[1:(n - 5), 1],
##D                               trainObs = 4320)
##D 
##D   # While training, we included 1 lag (the default), so we will also lag the
##D   #   observations we will test.
##D   testObs <- nrml[(n - 6):n, -1]
##D   testObs <- xts:::lag.xts(testObs, 0:1)
##D   testObs <- testObs[-1,]
##D   testObs <- cbind(nrml[(n - 5):n, 1], testObs)
##D 
##D   mspMonitor(observations = testObs[, -1],
##D              labelVector = testObs[, 1],
##D              trainingSummary = trainResults_ls$TrainingSpecs)
##D 
## End(Not run)




