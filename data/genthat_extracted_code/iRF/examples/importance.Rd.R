library(iRF)


### Name: importance
### Title: Extract variable importance measure
### Aliases: importance importance.default importance.randomForest
### Keywords: regression classif tree

### ** Examples

data(iris)
set.seed(4543)
iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE)
importance(iris.rf)



