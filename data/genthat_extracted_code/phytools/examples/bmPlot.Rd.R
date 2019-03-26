library(phytools)


### Name: bmPlot
### Title: Simulates and visualizes discrete-time Brownian evolution on a
###   phylogeny
### Aliases: bmPlot
### Keywords: phylogenetics plotting simulation

### ** Examples

# plot BM simulation on 20 taxon tree
tree<-pbtree(n=20)
x<-bmPlot(tree)

# plot simulation of a threshold character
tree<-pbtree(n=20)
x<-bmPlot(tree,type="threshold",thresholds=c(0,1,2))




