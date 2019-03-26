library(FossilSim)


### Name: place.fossils
### Title: Place fossil samples from one tree in another tree, or find the
###   ancestral node for each fossil sample in one tree.
### Aliases: place.fossils

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
place.fossils(t,f)



