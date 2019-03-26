library(TreeSearch)


### Name: RearrangeEdges
### Title: Rearrange edges of a phylogenetic tree
### Aliases: RearrangeEdges

### ** Examples

data('Lobo')
random.tree <- RandomTree(Lobo.phy)
edge <- random.tree$edge
parent <- edge[, 1]
child <- edge[, 2]
dataset <- PhyDat2Morphy(Lobo.phy)
RearrangeEdges(parent, child, dataset, EdgeSwapper=RootedNNISwap)




