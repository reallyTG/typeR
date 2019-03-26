library(ape)


### Name: checkValidPhylo
### Title: Check the Structure of a "phylo" Object
### Aliases: checkValidPhylo
### Keywords: manip

### ** Examples

tr <- rtree(3)
checkValidPhylo(tr)
tr$edge[1] <- 0
checkValidPhylo(tr)



