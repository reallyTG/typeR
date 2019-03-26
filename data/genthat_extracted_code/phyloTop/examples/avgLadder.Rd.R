library(phyloTop)


### Name: avgLadder
### Title: Average ladder size
### Aliases: avgLadder

### ** Examples

## Find the average ladder size in a random tree with 20 tips:
tree <- rtree(20)
plot(tree)
avgLadder(tree)
# and the normalised average ladder size:
avgLadder(tree, normalise=TRUE)





