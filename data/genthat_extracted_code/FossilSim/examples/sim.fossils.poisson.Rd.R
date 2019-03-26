library(FossilSim)


### Name: sim.fossils.poisson
### Title: Simulate fossils under a Poisson sampling model
### Aliases: sim.fossils.poisson
### Keywords: Poisson sampling

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils using the tree
rate = 2
f = sim.fossils.poisson(rate, tree = t)
plot(f, t)

# simulate fossils using taxonomy
s = sim.taxonomy(t, 0.5, 1, 0.5)
f = sim.fossils.poisson(rate, taxonomy = s)
plot(f, t)

# simulate fossils with autocorrelated rate variation across lineages
rates = sim.trait.values(init = rate, taxonomy = s, v = 1)
f = sim.fossils.poisson(rates, taxonomy = s)
plot(f, t)




