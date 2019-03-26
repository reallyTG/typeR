library(treedater)


### Name: rootToTipRegressionPlot
### Title: Plot evolutionary distance from root to sample times and
###   estimated internal node times and regression lines
### Aliases: rootToTipRegressionPlot

### ** Examples

## simulate a random tree and sample times for demonstration
# make a random tree:
tre <- ape::rtree(50)
# sample times based on distance from root to tip:
sts <- setNames( ape::node.depth.edgelength( tre )[1:ape::Ntip(tre)], tre$tip.label)
# modify edge length to represent evolutionary distance with rate 1e-3:
tre$edge.length <- tre$edge.length * 1e-3
# treedater: 
td <- dater( tre, sts =sts )
# root to tip regression: 
fit = rootToTipRegressionPlot( td )
summary(fit)




