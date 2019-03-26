library(EmpiricalCalibration)


### Name: plotExpectedType1Error
### Title: Plot the expected type 1 error as a function of standard error
### Aliases: plotExpectedType1Error

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
positive <- sccs[sccs$groundTruth == 1, ]
plotExpectedType1Error(negatives$logRr, negatives$seLogRr, positive$seLogRr)




