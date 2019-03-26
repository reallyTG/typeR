library(FossilSim)


### Name: sim.fossils.environment
### Title: Simulate fossils under an environment-dependent model of
###   preservation (Holland, 1995)
### Aliases: sim.fossils.environment
### Keywords: fossil non-uniform preseravtion

### ** Examples

# simulate tree
t = ape::rtree(6)

# assign a max age based on tree height
max.age = tree.max(t)

# generate water depth profile
strata = 7
wd = sim.gradient(strata)

# simulate fossils using tree & max.age and strata
f = sim.fossils.environment(t, max.age = max.age, strata = strata,
proxy.data = wd, PD = 0.5, DT = 1, PA = 1)
plot(f, t, show.proxy = TRUE, proxy.data = wd, strata = strata, show.strata = TRUE)

# simulate fossils using taxonomy & interval.ages
s = sim.taxonomy(t, 0.1, 0.1, 1)
times = seq(0, max.age, length.out = strata + 1)
f = sim.fossils.environment(taxonomy = s, interval.ages = times,
     proxy.data = wd, PD = 0.5, DT = 1, PA = 1)
plot(f, t, strata = strata, binned = TRUE)

# simulate fossils with variable preservation across lineages
dist = function() {runif(1)}
PD = sim.trait.values(1, taxonomy = s, model = "independent", dist = dist,
                     change.pr = 0.1)
f = sim.fossils.environment(taxonomy = s, interval.ages = times,
     proxy.data = wd, PD = PD, DT = 1, PA = 1)
plot(f, t, strata = strata, binned = TRUE)




