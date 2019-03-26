library(EmpiricalCalibration)


### Name: calibrateP
### Title: Calibrate the p-value
### Aliases: calibrateP calibrateP.null calibrateP.mcmcNull

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
null <- fitNull(negatives$logRr, negatives$seLogRr)
positive <- sccs[sccs$groundTruth == 1, ]
calibrateP(null, positive$logRr, positive$seLogRr)




