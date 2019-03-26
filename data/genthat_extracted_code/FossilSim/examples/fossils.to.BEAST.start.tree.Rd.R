library(FossilSim)


### Name: fossils.to.BEAST.start.tree
### Title: Create a suitable starting tree for a DPPDIV style FBD analysis
###   in BEAST2
### Aliases: fossils.to.BEAST.start.tree

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
fossils.to.BEAST.start.tree(t,f, complete = FALSE)



