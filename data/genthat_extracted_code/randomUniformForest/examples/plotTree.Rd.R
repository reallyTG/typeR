library(randomUniformForest)


### Name: plotTree
### Title: Plot a Random Uniform Decision Tree
### Aliases: plotTree

### ** Examples

# not run
data(airquality)
ozone.ruf <- randomUniformForest(Ozone ~ ., data = airquality, 
ntree = 20, BreimanBounds = FALSE, threads = 1)

OneTree <- getTree.randomUniformForest(ozone.ruf, 10)

# plotTree(OneTree) ##only a part is visible

## full tree : 
# plotTree(OneTree, fullTree = TRUE, xlim = c(1,55), ylim = c(0, 11))



