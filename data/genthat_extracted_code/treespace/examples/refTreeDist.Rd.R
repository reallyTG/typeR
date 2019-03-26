library(treespace)


### Name: refTreeDist
### Title: Metric function for comparing a reference 'phylo' to
###   'multiPhylo' input
### Aliases: refTreeDist

### ** Examples


## generate a single reference tree with 6 tips
refTree <- rtree(6)

## generate 10 random trees, each with 6 tips
trees <- rmtree(10,6)

## find the distances from each of the 10 random trees to the single reference tree
refTreeDist(refTree,trees)




