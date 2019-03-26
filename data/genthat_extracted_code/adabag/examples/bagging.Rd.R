library(adabag)


### Name: bagging
### Title: Applies the Bagging algorithm to a data set
### Aliases: bagging
### Keywords: tree classif

### ** Examples

## rpart library should be loaded
#This example has been hidden to fulfill execution time <5s
#library(rpart)
#data(iris)
#iris.bagging <- bagging(Species~., data=iris, mfinal=10)

# Data Vehicle (four classes)
library(rpart)
library(mlbench)
data(Vehicle)
l <- length(Vehicle[,1])
sub <- sample(1:l,2*l/3)
Vehicle.bagging <- bagging(Class ~.,data=Vehicle[sub, ],mfinal=5, 
	control=rpart.control(maxdepth=5, minsplit=15))
#Using the pruning option
Vehicle.bagging.pred <- predict.bagging(Vehicle.bagging,newdata=Vehicle[-sub, ], newmfinal=3)
Vehicle.bagging.pred$confusion
Vehicle.bagging.pred$error





