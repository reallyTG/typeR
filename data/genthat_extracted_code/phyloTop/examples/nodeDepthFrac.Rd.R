library(phyloTop)


### Name: nodeDepthFrac
### Title: Fraction of nodes beyond a given depth
### Aliases: nodeDepthFrac

### ** Examples

## Find the fraction of nodes with a depth of 5 or more, in a random tree with 20 tips:
tree <- rtree(20)
tree$edge.length <- rep(1,38) # so that the depths are easier to view in a plot
plot(tree)
nodeDepthFrac(tree,threshold=5) 




