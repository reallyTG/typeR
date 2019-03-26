library(FossilSim)


### Name: sim.tip.samples
### Title: Include extant and extinct tip samples in the fossil object,
###   with optional rho sampling.
### Aliases: sim.tip.samples

### ** Examples

# simulate tree
t = ape::rtree(6)

# simulate fossils
f = sim.fossils.poisson(2, t)

# simulate tip samples
f = sim.tip.samples(f, t, rho = 0.5)
plot(f, t)




