library(paleotree)


### Name: createMrBayesConstraints
### Title: Transform a Topology into a Set of Constraint Commands for
###   MrBayes
### Aliases: createMrBayesConstraints

### ** Examples

set.seed(444)
tree <- rtree(10)
createMrBayesConstraints(tree)
createMrBayesConstraints(tree,partial = FALSE)

## Not run: 
##D 
##D createMrBayesConstraints(tree,file = "topoConstraints.txt")
##D 
## End(Not run)



