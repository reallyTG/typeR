library(FossilSim)


### Name: fossils.to.BEAST.constraints
### Title: Create a set of BEAST2 constraints to construct a DPPDIV style
###   fixed extant topology FBD analysis
### Aliases: fossils.to.BEAST.constraints

### ** Examples

t = TreeSim::sim.bd.taxa(10, 1, 0.1, 0.05)[[1]]
f = sim.fossils.poisson(0.1, t, root.edge = FALSE)
fossils.to.BEAST.constraints(f, t, complete = TRUE)



