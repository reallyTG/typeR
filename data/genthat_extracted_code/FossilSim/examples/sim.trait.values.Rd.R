library(FossilSim)


### Name: sim.trait.values
### Title: Simulate trait values with variation across lineages
### Aliases: sim.trait.values

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate taxonomy
s = sim.taxonomy(t, 0.5, 1, 0.5)

# simulate rates under the autocorrelated trait values model
rate = 2
rates = sim.trait.values(rate, taxonomy = s, v = 1)
f = sim.fossils.poisson(rates, taxonomy = s)
plot(f, t)

# simulate rates under the independent trait values model
dist = function() { rlnorm(1, log(rate), 1) }
rates = sim.trait.values(rate, taxonomy = s, model = "independent", dist = dist)
f = sim.fossils.poisson(rates, taxonomy = s)
plot(f, t)

# simulate rates under the independent trait values model with infrequent changes
rates = sim.trait.values(rate, taxonomy = s, model = "independent",
                        dist = dist, change.pr = 0.1)
f = sim.fossils.poisson(rates, taxonomy = s)
plot(f, t)




