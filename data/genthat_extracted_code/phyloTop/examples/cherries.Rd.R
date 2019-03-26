library(phyloTop)


### Name: cherries
### Title: Cherry number
### Aliases: cherries

### ** Examples

## Find the number of cherries in a random tree with 10 tips:
tree <- rtree(10)
plot(tree)
cherries(tree)
# and the normalised cherry number:
cherries(tree, normalise=TRUE)

## Note that the function configShow can be used to highlight the cherries in the tree:
configShow(tree, 2, edge.width=2)





