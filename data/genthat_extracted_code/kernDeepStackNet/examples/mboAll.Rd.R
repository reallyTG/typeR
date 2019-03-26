library(kernDeepStackNet)


### Name: mboAll
### Title: Efficient global optimization inclusive meta model validation
### Aliases: mboAll
### Keywords: models & regression

### ** Examples

# Example with Branin function
library(globalOptTests)
tryBranin <- mboAll (loss_func=function (x) goTest(par=x, fnName="Branin", 
checkDim = FALSE), n_steps=5, initDesign=15, lower_bounds=c(-5, 0), 
upper_bounds=c(10, 15), x_start=c(5, -5))
abs(tryBranin$value-getGlobalOpt("Branin"))



