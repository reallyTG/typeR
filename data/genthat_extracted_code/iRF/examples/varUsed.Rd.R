library(iRF)


### Name: varUsed
### Title: Variables used in a random forest
### Aliases: varUsed
### Keywords: tree

### ** Examples

data(iris)
set.seed(17)
varUsed(randomForest(Species~., iris, ntree=100))



