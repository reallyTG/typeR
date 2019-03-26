library(pRoloc)


### Name: ksvmClassification
### Title: ksvm classification
### Aliases: ksvmClassification ksvmPrediction

### ** Examples

library(pRolocdata)
data(dunkley2006)
## reducing parameter search space and iterations 
params <- ksvmOptimisation(dunkley2006, cost = 2^seq(-1,4,5), times = 3)
params
plot(params)
f1Count(params)
levelPlot(params)
getParams(params)
res <- ksvmClassification(dunkley2006, params)
getPredictions(res, fcol = "ksvm")
getPredictions(res, fcol = "ksvm", t = 0.75)
plot2D(res, fcol = "ksvm")



