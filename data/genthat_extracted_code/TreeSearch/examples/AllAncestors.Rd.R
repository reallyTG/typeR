library(TreeSearch)


### Name: AllAncestors
### Title: List all ancestral nodes
### Aliases: AllAncestors

### ** Examples


tr <- ape::rtree(20, br=NULL)
edge <- tr$edge
AllAncestors(edge[, 1], edge[, 2])




