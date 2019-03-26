library(pRoloc)


### Name: rfClassification
### Title: rf classification
### Aliases: rfClassification rfPrediction

### ** Examples

library(pRolocdata)
data(dunkley2006)
## reducing parameter search space and iterations 
params <- rfOptimisation(dunkley2006, mtry = c(2, 5, 10),  times = 3)
params
plot(params)
f1Count(params)
levelPlot(params)
getParams(params)
res <- rfClassification(dunkley2006, params)
getPredictions(res, fcol = "rf")
getPredictions(res, fcol = "rf", t = 0.75)
plot2D(res, fcol = "rf")



