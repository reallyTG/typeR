library(adephylo)


### Name: treePart
### Title: Define partitions of tips according from a tree
### Aliases: treePart
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D if(require(ape) & require(phylobase)){
##D ## make a tree
##D x <- as(rtree(10),"phylo4")
##D partition <- treePart(x)
##D partition
##D 
##D ## plot the dummy vectors with the tree
##D temp <- phylo4d(x, partition)
##D table.phylo4d(temp, cent=FALSE, scale=FALSE)
##D }
## End(Not run)




