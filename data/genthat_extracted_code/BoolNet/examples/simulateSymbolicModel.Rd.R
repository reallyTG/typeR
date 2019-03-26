library(BoolNet)


### Name: simulateSymbolicModel
### Title: Simulate a symbolic Boolean network
### Aliases: simulateSymbolicModel
### Keywords: simulation symbolic Boolean network temporal predicates

### ** Examples

data(igf)

# exhaustive state space simulation
sim <- simulateSymbolicModel(igf)
plotAttractors(sim)

# exhaustive attractor search using SAT solver
sim <- simulateSymbolicModel(igf, method="sat.exhaustive")
plotAttractors(sim)



