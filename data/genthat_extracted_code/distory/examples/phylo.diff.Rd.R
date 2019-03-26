library(distory)


### Name: phylo.diff
### Title: Differences Between Phylogenetic Trees
### Aliases: phylo.diff distinct.edges edge.from.split get.bipartition
###   partition.leaves

### ** Examples


data(woodmouse)
otree <- root(fastme.ols(dist.dna(woodmouse)), "No305", resolve.root=TRUE)
breps = 10

trees <- boot.phylo(otree, woodmouse, B=breps, function(x)
        root(fastme.ols(dist.dna(x)), "No305", resolve.root=TRUE),trees=TRUE)

combined.trees <- c(list(otree), trees$trees)

binning <- bin.multiPhylo(combined.trees)

phylo.diff(combined.trees[[match(1, binning)]], combined.trees[[match(2, binning)]])




