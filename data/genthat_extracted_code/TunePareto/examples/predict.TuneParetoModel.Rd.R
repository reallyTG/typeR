library(TunePareto)


### Name: predict.TuneParetoModel
### Title: Prediction method for TuneParetoClassifier objects
### Aliases: predict.TuneParetoModel
### Keywords: prediction

### ** Examples

# train an SVM classifier
cl <- tunePareto.svm()
tr <- trainTuneParetoClassifier(cl, 
                                iris[,-ncol(iris)], 
                                iris[,ncol(iris)], 
                                cost=0.001)

# re-apply the classifier to predict the training data
print(iris[,ncol(iris)])
print(predict(tr, iris[,-ncol(iris)]))



