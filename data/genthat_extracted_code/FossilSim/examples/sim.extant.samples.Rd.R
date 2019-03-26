library(FossilSim)


### Name: sim.extant.samples
### Title: Include extant samples in the fossil object, with optional rho
###   sampling.
### Aliases: sim.extant.samples

### ** Examples

# simulate tree
lambda = 0.1
mu = 0.05
tips = 8
t = TreeSim::sim.bd.taxa(tips, 1, lambda, mu)[[1]]

# simulate fossils
f = sim.fossils.poisson(0.5, t)

# simulate extant samples
f = sim.extant.samples(f, t, rho = 0.5)
plot(f, t)




