library(iRF)


### Name: treesize
### Title: Size of trees in an ensemble
### Aliases: treesize
### Keywords: regression classif

### ** Examples

data(iris)
iris.rf <- randomForest(Species ~ ., iris)
hist(treesize(iris.rf))



