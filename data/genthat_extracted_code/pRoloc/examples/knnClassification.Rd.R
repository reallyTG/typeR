library(pRoloc)


### Name: knnClassification
### Title: knn classification
### Aliases: knnClassification knnPrediction

### ** Examples

library(pRolocdata)
data(dunkley2006)
## reducing parameter search space and iterations 
params <- knnOptimisation(dunkley2006, k = c(3, 10), times = 3)
params
plot(params)
f1Count(params)
levelPlot(params)
getParams(params)
res <- knnClassification(dunkley2006, params)
getPredictions(res, fcol = "knn")
getPredictions(res, fcol = "knn", t = 0.75)
plot2D(res, fcol = "knn")



