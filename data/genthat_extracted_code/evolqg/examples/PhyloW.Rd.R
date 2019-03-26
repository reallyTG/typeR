library(evolqg)


### Name: PhyloW
### Title: Calculates ancestral states of some statistic
### Aliases: PhyloW

### ** Examples

library(ape)
data(dentus)
data(dentus.tree)
tree <- dentus.tree
mat.list <- dlply(dentus, 'species', function(x) cov(x[,1:4]))
sample.sizes <- runif(length(tree$tip.label), 15, 20)
PhyloW(tree, mat.list, sample.sizes)



