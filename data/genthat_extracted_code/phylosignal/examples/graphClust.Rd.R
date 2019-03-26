library(phylosignal)


### Name: graphClust
### Title: Phylogenetically constrained clustering
### Aliases: graphClust

### ** Examples

data(navic)
gC <- graphClust(navic, lim.phylo = 1, lim.trait = 2, scale.lim = FALSE)
gC
plot.graphclust(gC, which = "selection", ask = FALSE)
plot.graphclust(gC, which = "graph", ask = FALSE)
plot.graphclust(gC, which = "tree", ask = FALSE)




