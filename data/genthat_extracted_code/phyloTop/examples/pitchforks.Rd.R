library(phyloTop)


### Name: pitchforks
### Title: Number of pitchforks
### Aliases: pitchforks

### ** Examples

## Find the number of pitchforks in a random tree with 20 tips:
tree <- rtree(20)
plot(tree)
pitchforks(tree)
# and the normalised pitchfork number:
pitchforks(tree, normalise=TRUE)

## Note that the function configShow can be used to highlight the pitchforks in the tree:
configShow(tree, 3, edge.width=2)





