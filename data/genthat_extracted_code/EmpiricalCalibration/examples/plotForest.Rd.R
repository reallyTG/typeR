library(EmpiricalCalibration)


### Name: plotForest
### Title: Create a forest plot
### Aliases: plotForest

### ** Examples

data(sccs)
negatives <- sccs[sccs$groundTruth == 0, ]
plotForest(negatives$logRr, negatives$seLogRr, negatives$drugName)




