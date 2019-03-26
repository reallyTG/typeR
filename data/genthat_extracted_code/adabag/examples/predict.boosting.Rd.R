library(adabag)


### Name: predict.boosting
### Title: Predicts from a fitted boosting object
### Aliases: predict.boosting
### Keywords: tree classif

### ** Examples

## rpart library should be loaded
#This example has been hidden to fulfill execution time <5s 
#library(rpart)
#data(iris)
#sub <- c(sample(1:50, 25), sample(51:100, 25), sample(101:150, 25))
#iris.adaboost <- boosting(Species ~ ., data=iris[sub,], mfinal=10)
#iris.predboosting<- predict.boosting(iris.adaboost, newdata=iris[-sub,])
#iris.predboosting$prob

## rpart and mlbench libraries should be loaded
## Comparing the test error of rpart and adaboost.M1
library(rpart)
library(mlbench)
data(BreastCancer)
l <- length(BreastCancer[,1])
sub <- sample(1:l,2*l/3)

BC.rpart <- rpart(Class~.,data=BreastCancer[sub,-1], maxdepth=3)
BC.rpart.pred <- predict(BC.rpart,newdata=BreastCancer[-sub,-1],type="class")
tb <-table(BC.rpart.pred,BreastCancer$Class[-sub])
error.rpart <- 1-(sum(diag(tb))/sum(tb))
tb
error.rpart

BC.adaboost <- boosting(Class ~.,data=BreastCancer[,-1],mfinal=10, coeflearn="Freund", 
boos=FALSE , control=rpart.control(maxdepth=3))

#Using the pruning option
BC.adaboost.pred <- predict.boosting(BC.adaboost,newdata=BreastCancer[-sub,-1], newmfinal=10)
BC.adaboost.pred$confusion
BC.adaboost.pred$error







