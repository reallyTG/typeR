library(DMwR)


### Name: rt.prune
### Title: Prune a tree-based model using the SE rule
### Aliases: rt.prune
### Keywords: models

### ** Examples

data(iris)
tree <- rpartXse(Species ~ ., iris)
tree

## A visual representation of the classification tree
## Not run: 
##D prettyTree(tree)
## End(Not run)



