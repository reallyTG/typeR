library(EmpiricalCalibration)


### Name: computeTraditionalP
### Title: Compute the (traditional) p-value
### Aliases: computeTraditionalP

### ** Examples

data(sccs)
positive <- sccs[sccs$groundTruth == 1, ]
computeTraditionalP(positive$logRr, positive$seLogRr)




