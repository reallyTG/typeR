library(distory)


### Name: bin.multiPhylo
### Title: Bin Trees
### Aliases: bin.multiPhylo

### ** Examples


data(woodmouse)
otree <- root(fastme.ols(dist.dna(woodmouse)), "No305", resolve.root=TRUE)
breps = 500

trees <- boot.phylo(otree, woodmouse, B=breps, function(x)
        root(fastme.ols(dist.dna(x)), "No305", resolve.root=TRUE),trees=TRUE)

combined.trees <- c(list(otree), trees$trees)

bin.multiPhylo(combined.trees)




