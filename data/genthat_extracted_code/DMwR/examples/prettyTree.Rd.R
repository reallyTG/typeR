library(DMwR)


### Name: prettyTree
### Title: Visual representation of a tree-based model
### Aliases: prettyTree
### Keywords: models

### ** Examples

data(iris)
tree <- rpartXse(Species ~ ., iris)
## Not run: 
##D prettyTree(tree)
##D prettyTree(tree,all=F,use.n=F,branch=0)
## End(Not run)



