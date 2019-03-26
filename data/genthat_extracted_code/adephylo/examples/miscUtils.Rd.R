library(adephylo)


### Name: .tipToRoot
### Title: Low-level auxiliary functions for adephylo
### Aliases: .tipToRoot
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(20),"phylo4")
plot(x,show.node=TRUE)

## .tipToRoot
root <- rootNode(x)
.tipToRoot(x, 1, root)
lapply(1:nTips(x), function(i) .tipToRoot(x, i, root))
}




