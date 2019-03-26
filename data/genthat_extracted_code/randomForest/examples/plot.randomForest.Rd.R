library(randomForest)


### Name: plot.randomForest
### Title: Plot method for randomForest objects
### Aliases: plot.randomForest
### Keywords: classif regression tree

### ** Examples

data(mtcars)
plot(randomForest(mpg ~ ., mtcars, keep.forest=FALSE, ntree=100), log="y")



