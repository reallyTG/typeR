library(FossilSim)


### Name: FossilSim
### Title: FossilSim: A package for simulating and plotting fossil and
###   taxonomy data
### Aliases: FossilSim FossilSim-package

### ** Examples

# simulate a tree using TreeSim conditioned on tip number
t = TreeSim::sim.bd.taxa(n = 10, numbsim = 1, lambda = 1, mu = 0.2)[[1]]

# simulate taxonomy under mixed speciation
s = sim.taxonomy(tree = t, beta = 0.5, lambda.a = 1, kappa = 0.1)
# plot the result
plot(s, tree = t, legend.position = "topleft")

# simulate fossils using the phylogeny and a constant fossil recovery rate
f = sim.fossils.poisson(rate = 3, tree = t)
# plot the result
plot(f, tree = t)

# simulate fossils using the taxonomy and a constant fossil recovery rate
f = sim.fossils.poisson(rate = 3, taxonomy = s)
# plot the result
plot(f, tree = t, taxonomy = s, show.taxonomy = TRUE)

# simulate fossils using time-dependent fossil recovery rates
f = sim.fossils.intervals(tree = t, rates = c(1, 0.1, 1, 0.1), max.age = tree.max(t), strata = 4)
# plot the result, with the time intervals
plot(f, tree = t, show.strata = TRUE, max.age = tree.max(t), strata = 4)




