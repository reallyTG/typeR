library(randomForest)


### Name: importance
### Title: Extract variable importance measure
### Aliases: importance importance.default importance.randomForest
### Keywords: regression classif tree

### ** Examples

set.seed(4543)
data(mtcars)
mtcars.rf <- randomForest(mpg ~ ., data=mtcars, ntree=1000,
                          keep.forest=FALSE, importance=TRUE)
importance(mtcars.rf)
importance(mtcars.rf, type=1)



