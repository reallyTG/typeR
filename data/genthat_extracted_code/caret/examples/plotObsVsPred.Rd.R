library(caret)


### Name: plotObsVsPred
### Title: Plot Observed versus Predicted Results in Regression and
###   Classification Models
### Aliases: plotObsVsPred
### Keywords: hplot

### ** Examples


## Not run: 
##D # regression example
##D data(BostonHousing)
##D rpartFit <- train(BostonHousing[1:100, -c(4, 14)], 
##D                   BostonHousing$medv[1:100], 
##D                   "rpart", tuneLength = 9)
##D plsFit <- train(BostonHousing[1:100, -c(4, 14)], 
##D                 BostonHousing$medv[1:100], 
##D                 "pls")
##D 
##D predVals <- extractPrediction(list(rpartFit, plsFit), 
##D                               testX = BostonHousing[101:200, -c(4, 14)], 
##D                               testY = BostonHousing$medv[101:200], 
##D                               unkX = BostonHousing[201:300, -c(4, 14)])
##D 
##D plotObsVsPred(predVals)
##D 
##D 
##D #classification example
##D data(Satellite)
##D numSamples <- dim(Satellite)[1]
##D set.seed(716)
##D 
##D varIndex <- 1:numSamples
##D 
##D trainSamples <- sample(varIndex, 150)
##D 
##D varIndex <- (1:numSamples)[-trainSamples]
##D testSamples <- sample(varIndex, 100)
##D 
##D varIndex <- (1:numSamples)[-c(testSamples, trainSamples)]
##D unkSamples <- sample(varIndex, 50)
##D 
##D trainX <- Satellite[trainSamples, -37]
##D trainY <- Satellite[trainSamples, 37]
##D 
##D testX <- Satellite[testSamples, -37]
##D testY <- Satellite[testSamples, 37]
##D 
##D unkX <- Satellite[unkSamples, -37]
##D 
##D knnFit  <- train(trainX, trainY, "knn")
##D rpartFit <- train(trainX, trainY, "rpart")
##D 
##D predTargets <- extractPrediction(list(knnFit, rpartFit), 
##D                                  testX = testX, 
##D                                  testY = testY, 
##D                                  unkX = unkX)
##D 
##D plotObsVsPred(predTargets)
## End(Not run)




