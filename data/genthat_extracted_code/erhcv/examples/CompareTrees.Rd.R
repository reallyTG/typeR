library(erhcv)


### Name: CompareTrees
### Title: Compare two tree structures
### Aliases: CompareTrees

### ** Examples

## Comparison between "identical" and "compareTrees"
##
## The trees are "identical"

tree1 <- list(list(list(5, 6), list(7, 8), 3, 4), list(9, 10), 2, 1)
tree2 <- list(list(list(5, 6), list(7, 8), 3, 4), list(9, 10), 2, 1)

CompareTrees(tree1, tree2)
identical(tree1, tree2)

## The trees are "equivalent" (notice the leaves 1 and 2 interchanged)

tree1 <- list(list(list(5, 6), list(7, 8), 3, 4), list(9, 10), 2, 1)
tree2 <- list(list(list(5, 6), list(7, 8), 3, 4), list(9, 10), 1, 2)

CompareTrees(tree1, tree2)
identical(tree1, tree2)




