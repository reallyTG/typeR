library(RRF)


### Name: treesize
### Title: Size of trees in an ensemble
### Aliases: treesize
### Keywords: regression classif

### ** Examples

data(iris)
iris.rf <- RRF(Species ~ ., iris)
hist(treesize(iris.rf))



