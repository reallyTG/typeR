library(iRF)


### Name: varImpPlot
### Title: Variable Importance Plot
### Aliases: varImpPlot
### Keywords: regression classif tree

### ** Examples

set.seed(4543)
data(iris)
iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE)
varImpPlot(iris.rf)



