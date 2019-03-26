library(treeman)


### Name: getBiprts
### Title: Get the sets of labels for each bipartition in tree
### Aliases: getBiprts

### ** Examples

library(treeman)
tree <- randTree(10)
# get all of the tip IDs for each branch in the rooted tree
(getBiprts(tree))
# ignore the root and get bipartitions for unrooted tree
(getBiprts(tree, root = FALSE))
# use the universal code for comparing splits between trees
(getBiprts(tree, root = FALSE, universal = TRUE))



