library(EmpiricalCalibration)


### Name: fitNull
### Title: Fit the null distribution
### Aliases: fitNull

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
null <- fitNull(negatives$logRr, negatives$seLogRr)
null




