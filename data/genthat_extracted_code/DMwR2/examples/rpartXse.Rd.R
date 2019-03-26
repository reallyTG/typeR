library(DMwR2)


### Name: rpartXse
### Title: Obtain a tree-based model
### Aliases: rpartXse
### Keywords: models

### ** Examples

data(iris)
tree <- rpartXse(Species ~ ., iris)
tree

## A visual representation of the classification tree
## Not run: 
##D prettyTree(tree)
## End(Not run)



