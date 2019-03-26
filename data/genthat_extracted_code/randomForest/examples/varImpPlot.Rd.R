library(randomForest)


### Name: varImpPlot
### Title: Variable Importance Plot
### Aliases: varImpPlot
### Keywords: regression classif tree

### ** Examples

set.seed(4543)
data(mtcars)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000, keep.forest=FALSE,
                          importance=TRUE)
varImpPlot(mtcars.rf)



