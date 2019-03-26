library(adephylo)


### Name: sp.tips
### Title: Find the shortest path between tips of a tree
### Aliases: sp.tips
### Keywords: manip

### ** Examples


## Not run: 
##D if(require(ape) & require(phylobase)){
##D ## make a tree
##D x <- as(rtree(20),"phylo4")
##D plot(x,show.node=TRUE)
##D ## get shortest path between tip 1 and all other tips.
##D sp.tips(x, "t1", "t2")
##D sp.tips(x, 1, 2:20, TRUE)
##D }
## End(Not run)




