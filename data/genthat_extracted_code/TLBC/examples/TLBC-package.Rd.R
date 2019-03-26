library(TLBC)


### Name: TLBC-package
### Title: Two-Level Behavior Classification
### Aliases: TLBC-package TLBC
### Keywords: package

### ** Examples

## Not run: 
##D 
##D # train a new model
##D myAnnotations="~/myStudy/annotations.csv"
##D myAccel="~/myStudy/HipGT3X+"
##D myGPS="~/myStudy/GPS.csv"
##D WS=60
##D myModel="~/myStudy/myModel.RData"
##D trainModel(annotations=myAnnotations, accelerometers=myAccel, GPS=myGPS, winSize=WS, 
##D modelName=myModel)
##D 
##D # classify using a model computed yourself
##D myAccel="~/myStudy/HipGT3X+"
##D myGPS="~/myStudy/GPS.csv"
##D myModel="~/myStudy/myModel.RData"
##D myPredictions="~/myStudy/myModelPredictions"
##D classify(accelerometers=myAccel, GPS=myGPS, modelName=myModel, saveDir=myPredictions)
##D 
##D # compute the performance of a model on a dataset
##D myAnnotations="~/myStudy/annotations.csv"
##D myPredictions="~/myStudy/myModelPredictions"
##D WS=60
##D calcPerformance(annotations=myAnnotations, predictions=myPredictions, winSize=WS)
##D 
##D # perform leave-one-out cross-validation on a dataset
##D myAnnotations="~/myStudy/annotations.csv"
##D myAccel="~/myStudy/HipGT3X+"
##D WS=60
##D myPredictions="~/myStudy/looXvalPredictions"
##D looXval(annotations=myAnnotations, accelerometers=myAccel, winSize=WS, saveDir=myPredictions)
##D 
## End(Not run)




