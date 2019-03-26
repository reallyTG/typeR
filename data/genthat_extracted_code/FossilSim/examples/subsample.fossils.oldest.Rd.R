library(FossilSim)


### Name: subsample.fossils.oldest
### Title: Obtain a subsample of fossil occurrences containing the oldest
###   fossil sample in each node of the tree.
### Aliases: subsample.fossils.oldest

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
subsample.fossils.oldest(f, t, complete = FALSE)



