library(pRoloc)


### Name: svmClassification
### Title: svm classification
### Aliases: svmClassification svmPrediction

### ** Examples

library(pRolocdata)
data(dunkley2006)
## reducing parameter search space and iterations 
params <- svmOptimisation(dunkley2006, cost = 2^seq(-2,2,2), sigma = 10^seq(-1, 1, 1),  times = 3)
params
plot(params)
f1Count(params)
levelPlot(params)
getParams(params)
res <- svmClassification(dunkley2006, params)
getPredictions(res, fcol = "svm")
getPredictions(res, fcol = "svm", t = 0.75)
plot2D(res, fcol = "svm")



