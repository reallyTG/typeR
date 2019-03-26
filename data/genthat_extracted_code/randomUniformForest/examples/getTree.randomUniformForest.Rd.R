library(randomUniformForest)


### Name: getTree.randomUniformForest
### Title: Extract a tree from a forest
### Aliases: getTree.randomUniformForest getTree

### ** Examples

data(iris)
iris.ruf <- randomUniformForest(Species ~ ., data = iris, 
threads = 1, ntree = 20, BreimanBounds = FALSE) 

# get the 10th tree
OneTree <- getTree.randomUniformForest(iris.ruf, 10)



