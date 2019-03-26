library(evolqg)


### Name: PhyloCompare
### Title: Compares sister groups
### Aliases: PhyloCompare

### ** Examples

library(ape)
data(bird.orders)
tree <- bird.orders
mat.list <- RandomMatrix(5, length(tree$tip.label))
names(mat.list) <- tree$tip.label
sample.sizes <- runif(length(tree$tip.label), 15, 20)
phylo.state <- PhyloW(tree, mat.list, sample.sizes)

phylo.comparisons <- PhyloCompare(tree, phylo.state)

# plotting results on a phylogeny:
## Not run: 
##D library(phytools)
##D plotBranchbyTrait(tree, phylo.comparisons[[2]])
## End(Not run)



