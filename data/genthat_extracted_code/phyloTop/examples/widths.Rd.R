library(phyloTop)


### Name: widths
### Title: Number of nodes at each depth
### Aliases: widths

### ** Examples

## Find the node widths in a random tree with 10 tips:
tree <- rtree(10)
tree$edge.length <- rep(1,18) # to make it easier to see the width and depths in the plot
plot(tree)
widths(tree)




