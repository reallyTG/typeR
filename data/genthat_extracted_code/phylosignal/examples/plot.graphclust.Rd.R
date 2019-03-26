library(phylosignal)


### Name: plot.graphclust
### Title: Plot phylogenetically constrained clustering
### Aliases: plot.graphclust

### ** Examples

data(navic)
gC <- graphClust(navic, lim.phylo = 1, lim.trait = 2, scale.lim = FALSE)
plot.graphclust(gC, which = "selection", ask = FALSE)
plot.graphclust(gC, which = "graph", ask = FALSE)
plot.graphclust(gC, which = "tree", ask = FALSE)




