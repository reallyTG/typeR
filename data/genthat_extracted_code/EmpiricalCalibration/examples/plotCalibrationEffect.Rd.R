library(EmpiricalCalibration)


### Name: plotCalibrationEffect
### Title: Plot the effect of the calibration
### Aliases: plotCalibrationEffect

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
positive <- sccs[sccs$groundTruth == 1, ]
plotCalibrationEffect(negatives$logRr, negatives$seLogRr, positive$logRr, positive$seLogRr)




