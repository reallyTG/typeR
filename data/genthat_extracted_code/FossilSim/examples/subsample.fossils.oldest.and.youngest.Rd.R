library(FossilSim)


### Name: subsample.fossils.oldest.and.youngest
### Title: Obtain a subsample of fossil occurrences containing the oldest
###   and youngest fossil sample found at each node of the tree.
### Aliases: subsample.fossils.oldest.and.youngest

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
subsample.fossils.oldest.and.youngest(f, t, complete = FALSE)



