library(TunePareto)


### Name: trainTuneParetoClassifier
### Title: Train a TunePareto classifier
### Aliases: trainTuneParetoClassifier
### Keywords: training classifier training

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



