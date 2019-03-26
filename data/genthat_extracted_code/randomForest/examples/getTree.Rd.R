library(randomForest)


### Name: getTree
### Title: Extract a single tree from a forest.
### Aliases: getTree
### Keywords: tree

### ** Examples

data(iris)
## Look at the third trees in the forest.
getTree(randomForest(iris[,-5], iris[,5], ntree=10), 3, labelVar=TRUE)



