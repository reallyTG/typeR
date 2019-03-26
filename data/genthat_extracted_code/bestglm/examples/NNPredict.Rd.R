library(bestglm)


### Name: NNPredict
### Title: Nearest Neighbour Regression Prediction
### Aliases: NNPredict
### Keywords: prediction

### ** Examples

AQ <- airquality[complete.cases(airquality),c(2,3,4,1)]
XyList <- trainTestPartition(AQ)
NNPredict(XyList) 



