library(FossilSim)


### Name: remove.stem.fossils
### Title: Remove fossil samples that occur in the stem
### Aliases: remove.stem.fossils

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
remove.stem.fossils(f, t)



