library(FossilSim)


### Name: subsample.fossils.uniform
### Title: Obtain a uniform random sample of fossil occurrences.
### Aliases: subsample.fossils.uniform

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
subsample.fossils.uniform(f, 0.5)



