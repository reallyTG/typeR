library(adabag)


### Name: bagging.cv
### Title: Runs v-fold cross validation with Bagging
### Aliases: bagging.cv
### Keywords: tree classif

### ** Examples

## rpart library should be loaded
library(rpart)
data(iris)
iris.baggingcv <- bagging.cv(Species ~ ., v=2, data=iris, mfinal=3,
control=rpart.control(cp=0.01))
iris.baggingcv[-1]


## rpart and mlbench libraries should be loaded
## Data Vehicle (four classes) 
#This example has been hidden to keep execution time <5s
#data(Vehicle)
#Vehicle.bagging.cv <- bagging.cv(Class ~.,data=Vehicle,v=5,mfinal=10, 
#control=rpart.control(maxdepth=5))
#Vehicle.bagging.cv[-1]




