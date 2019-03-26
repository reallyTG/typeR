library(EmpiricalCalibration)


### Name: plotCalibration
### Title: Create a calibration plot
### Aliases: plotCalibration

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
plotCalibration(negatives$logRr, negatives$seLogRr)




