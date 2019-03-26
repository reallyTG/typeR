library(phytools)


### Name: phylo.heatmap
### Title: Creates a phylogenetic heat map
### Aliases: phylo.heatmap
### Keywords: phylogenetics plotting

### ** Examples

# simulate tree
tree <- pbtree(n=20,scale=1)
# simulate continuous character
X <- fastBM(tree, nsim=5)
phylo.heatmap(tree, X, grid=TRUE)



