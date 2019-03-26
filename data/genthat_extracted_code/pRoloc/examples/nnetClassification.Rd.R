library(pRoloc)


### Name: nnetClassification
### Title: nnet classification
### Aliases: nnetClassification nnetPrediction

### ** Examples

library(pRolocdata)
data(dunkley2006)
## reducing parameter search space and iterations 
params <- nnetOptimisation(dunkley2006, decay = 10^(c(-1, -5)), size = c(5, 10), times = 3)
params
plot(params)
f1Count(params)
levelPlot(params)
getParams(params)
res <- nnetClassification(dunkley2006, params)
getPredictions(res, fcol = "nnet")
getPredictions(res, fcol = "nnet", t = 0.75)
plot2D(res, fcol = "nnet")



