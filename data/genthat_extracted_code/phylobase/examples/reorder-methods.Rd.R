library(phylobase)


### Name: reorder-methods
### Title: reordering trees within phylobase objects
### Aliases: reorder-methods reorder reorder,phylo4-method
### Keywords: methods

### ** Examples

phy <- phylo4(ape::rtree(5))
edges(reorder(phy, "preorder"))
edges(reorder(phy, "postorder"))



