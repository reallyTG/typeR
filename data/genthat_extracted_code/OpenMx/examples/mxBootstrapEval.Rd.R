library(OpenMx)


### Name: mxBootstrapEval
### Title: Evaluate Values in a bootstrapped MxModel
### Aliases: mxBootstrapEval omxBootstrapEvalCov omxBootstrapEval
###   omxBootstrapEvalByName mxBootstrapEvalByName

### ** Examples


library(OpenMx)

testModel <- mxModel(
  model="testModel",
  mxData(data.frame(weight=1.0, value=1:10), "raw", weight = "weight"),
  mxMatrix("Full", nrow = 1, ncol = 1, values = 1, free=TRUE, name = "A"),
  mxAlgebra(data.weight * filteredDataRow, name = 'rowAlgebra'),
  mxAlgebra((sum(rowResults) - A)^2, name = 'reduceAlgebra'),
  mxFitFunctionRow('rowAlgebra', 'reduceAlgebra', 'value'))

testModel <- mxRun(testModel)
testBoot <- mxBootstrap(testModel)
summary(testBoot)

mxBootstrapEval(A^2, testBoot)



