library(RSSL)


### Name: SelfLearning
### Title: Self-Learning approach to Semi-supervised Learning
### Aliases: SelfLearning

### ** Examples

data(testdata)
t_self <- SelfLearning(testdata$X,testdata$y,testdata$X_u,method=NearestMeanClassifier)
t_sup <- NearestMeanClassifier(testdata$X,testdata$y)
# Classification Error
1-mean(predict(t_self, testdata$X_test)==testdata$y_test) 
1-mean(predict(t_sup, testdata$X_test)==testdata$y_test) 
loss(t_self, testdata$X_test, testdata$y_test)



