library(TreePar)


### Name: addroot
### Title: addroot: Adds a root edge ancestral to the first branching
###   event.
### Aliases: addroot

### ** Examples

set.seed(1)
# Simulate a tree
tree<-sim.bd.taxa(20,1,2,1,complete=FALSE,stochsampling=TRUE)
# add the root edge to the vector tree$edge and tree$edge.length
addroot(tree[[1]],tree[[1]]$root.edge)



