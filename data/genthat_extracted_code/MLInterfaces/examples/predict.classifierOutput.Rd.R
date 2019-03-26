library(MLInterfaces)


### Name: predict.classifierOutput
### Title: Predict method for 'classifierOutput' objects
### Aliases: predict.classifierOutput

### ** Examples

set.seed(1234)
data(sample.ExpressionSet)
trainInd <- 1:16

clout.svm <- MLearn(type~., sample.ExpressionSet[100:250,], svmI, trainInd)
predict(clout.svm, sample.ExpressionSet[100:250,-trainInd])

clout.ksvm <- MLearn(type~., sample.ExpressionSet[100:250,], ksvmI, trainInd)
predict(clout.ksvm, sample.ExpressionSet[100:250,-trainInd])

clout.nnet <- MLearn(type~., sample.ExpressionSet[100:250,], nnetI, trainInd, size=3, decay=.01 )
predict(clout.nnet, sample.ExpressionSet[100:250,-trainInd])

clout.knn <- MLearn(type~., sample.ExpressionSet[100:250,], knnI(k=3), trainInd)
predict(clout.knn, sample.ExpressionSet[100:250,-trainInd],k=1)
predict(clout.knn, sample.ExpressionSet[100:250,-trainInd],k=3)

clout.plsda <- MLearn(type~., sample.ExpressionSet[100:250,], plsdaI, trainInd)
predict(clout.plsda, sample.ExpressionSet[100:250,-trainInd])

clout.nb <- MLearn(type~., sample.ExpressionSet[100:250,], naiveBayesI, trainInd)
predict(clout.nb, sample.ExpressionSet[100:250,-trainInd])

# this can fail if training set does not yield sufficient diversity in response vector;
# setting seed seems to help with this example, but other applications may have problems
#
clout.rf <- MLearn(type~., sample.ExpressionSet[100:250,], randomForestI, trainInd)
predict(clout.rf, sample.ExpressionSet[100:250,-trainInd])



