library(mvMonitoring)


### Name: mspSPEPlot
### Title: Squared Prediction Error Contribution Plots
### Aliases: mspSPEPlot

### ** Examples

## Not run: 
##D # Create some data
##D dataA1 <- mspProcessData(faults = "B1")
##D traindataA1 <- dataA1[1:8567,]
##D 
##D # Train on the data that should be in control
##D trainResults <- mspTrain(traindataA1[,-1], traindataA1[,1], trainObs = 4320)
##D 
##D 
##D # Lag an out of control observation
##D testdataA1 <- dataA1[8567:8568,-1]
##D testdataA1 <- lag.xts(testdataA1,0:1)
##D testdataA1 <- testdataA1[-1,]
##D testdataA1 <- cbind(dataA1[8568,1],testdataA1)
##D 
##D # Monitor this observation
##D monitorResults <- mspMonitor(observations = testdataA1[,-1],
##D                              labelVector = testdataA1[,1],
##D                              trainingSummary = trainResults$TrainingSpecs)
##D 
##D 
##D tD <- traindataA1[,-1]
##D tL <- traindataA1[,1]
##D nD <- testdataA1[,-1]
##D nL <- testdataA1[,1]
##D tO <- trainObs
##D vA <- 0.95
##D nSPE <- monitorResults$SPE
##D tSPE <- trainResults$TrainingSpecs[[nL]]$SPE
##D 
##D mspSPEPlot(tD,tL,tSPE,nD,nL,nSPE,tO,vA)
## End(Not run)



