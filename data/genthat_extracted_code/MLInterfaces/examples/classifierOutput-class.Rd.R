library(MLInterfaces)


### Name: classifierOutput-class
### Title: Class "classifierOutput"
### Aliases: classifierOutput-class RObject,classifierOutput-method RObject
###   trainInd,classifierOutput-method trainInd
###   show,classifierOutput-method testScores,classifierOutput-method
###   trainScores,classifierOutput-method
###   predictions,classifierOutput-method predictions
###   predScores,classifierOutput-method predScores
###   predScore,classifierOutput-method predScore
###   testPredictions,classifierOutput-method testPredictions
###   trainPredictions trainPredictions,classifierOutput-method
###   fsHistory,classifierOutput-method testScores trainScores
###   testPredictions
### Keywords: classes

### ** Examples

showClass("classifierOutput")
library(golubEsets)
data(Golub_Train) # now cross-validate a neural net
set.seed(1234)
xv5 = xvalSpec("LOG", 5, balKfold.xvspec(5))
m2 = MLearn(ALL.AML~., Golub_Train[1000:1050,], nnetI, xv5, 
   size=5, decay=.01, maxit=1900 )
testScores(RObject(m2)[[1]]$mlans)
alls = lapply(RObject(m2), function(x) testScores(x$mlans))



