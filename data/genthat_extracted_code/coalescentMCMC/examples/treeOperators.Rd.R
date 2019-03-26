library(coalescentMCMC)


### Name: treeOperators
### Title: Trees Operators for Running MCMC
### Aliases: treeOperators NeighborhoodRearrangement TipInterchange
###   EdgeLengthJittering
### Keywords: manip

### ** Examples

tr <- rcoal(10)
ts <- NeighborhoodRearrangement(tr, 10, 19, 15, 1, branching.times(tr))
layout(matrix(1:2, 2))
plot(tr); plot(ts)
layout(1)



