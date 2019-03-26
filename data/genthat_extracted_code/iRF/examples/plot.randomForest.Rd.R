library(iRF)


### Name: plot.randomForest
### Title: Plot method for randomForest objects
### Aliases: plot.randomForest
### Keywords: classif regression tree

### ** Examples

data(iris)
plot(randomForest(Species ~ ., iris, keep.forest=FALSE, ntree=100))



