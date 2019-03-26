library(EmpiricalCalibration)


### Name: computeTraditionalCi
### Title: Compute the (traditional) confidence interval
### Aliases: computeTraditionalCi

### ** Examples

data(sccs)
positive <- sccs[sccs$groundTruth == 1, ]
computeTraditionalCi(positive$logRr, positive$seLogRr)




