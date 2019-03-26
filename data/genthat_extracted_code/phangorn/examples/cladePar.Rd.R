library(phangorn)


### Name: cladePar
### Title: Utility function to plot.phylo
### Aliases: cladePar
### Keywords: plot

### ** Examples


tree <- rtree(10)
plot(tree)
nodelabels()
x <- cladePar(tree, 12)
cladePar(tree, 18, "blue", "blue", x=x, plot=TRUE)




