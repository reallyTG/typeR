library(adabag)


### Name: predict.bagging
### Title: Predicts from a fitted bagging object
### Aliases: predict.bagging
### Keywords: tree classif

### ** Examples

#library(rpart)
#data(iris)
#sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
#iris.bagging <- bagging(Species ~ ., data=iris[sub,], mfinal=5)
#iris.predbagging<- predict.bagging(iris.bagging, newdata=iris[-sub,])
#iris.predbagging

## rpart and mlbench libraries should be loaded
library(rpart)
library(mlbench)
data(BreastCancer)
l <- length(BreastCancer[,1])
sub <- sample(1:l,2*l/3)
BC.bagging <- bagging(Class ~.,data=BreastCancer[,-1],mfinal=5, 
control=rpart.control(maxdepth=3))
BC.bagging.pred <- predict.bagging(BC.bagging,newdata=BreastCancer[-sub,-1])
BC.bagging.pred$prob
BC.bagging.pred$confusion
BC.bagging.pred$error





