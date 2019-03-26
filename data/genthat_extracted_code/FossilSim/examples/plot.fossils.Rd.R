library(FossilSim)


### Name: plot.fossils
### Title: Plot simulated fossils
### Aliases: plot.fossils

### ** Examples

set.seed(123)

## simulate tree
t = TreeSim::sim.bd.taxa(8, 1, 1, 0.3)[[1]]

## simulate fossils under a Poisson sampling process
f = sim.fossils.poisson(rate = 3, tree = t)
plot(f, t)
# add a set of equal length strata
plot(f, t, show.strata = TRUE, strata = 4)
# show stratigraphic ranges
plot(f, t, show.strata = TRUE, strata = 4, show.ranges = TRUE)

## simulate fossils and highlight taxonomy
s = sim.taxonomy(t, 0.5, 1)
f = sim.fossils.poisson(rate = 3, taxonomy = s)
plot(f, t, taxonomy = s, show.taxonomy = TRUE, show.ranges = TRUE)


## simulate fossils under a non-uniform model of preservation
# assign a max interval based on tree height
max.age = tree.max(t)
times = c(0, 0.3, 1, max.age)
rates = c(4, 1, 0.1)
f = sim.fossils.intervals(t, interval.ages = times, rates = rates)
plot(f, t, show.strata = TRUE, interval.ages = times)
# add proxy data
plot(f, t, show.strata = TRUE, interval.ages = times, show.proxy = TRUE, proxy.data = rates)




