library(FossilSim)


### Name: sim.fossils.intervals
### Title: Simulate fossils under a non-uniform model of preservation for a
###   given set of consecutive time intervals
### Aliases: sim.fossils.intervals
### Keywords: fossil non-uniform preservation uniform

### ** Examples

# simulate tree
t = ape::rtree(6)

# assign a max age based on tree height
max.age = tree.max(t)

# simulate fossils using max.age and strata & probabilities
strata = 4
probability = rep(0.7, 4)
f = sim.fossils.intervals(t, max.age = max.age, strata = strata, probabilities = probability)
plot(f, t, strata = strata, show.strata = TRUE)

# simulate fossils using interval.ages & rates
times = c(0, sort(runif(3, min = 0, max = max.age)), max.age)
rates = c(5, 0, 5, 0)
f = sim.fossils.intervals(t, interval.ages = times, rates = rates)
plot(f, t, interval.ages = times, show.strata = TRUE)

# simulate fossils using taxonomy
s = sim.taxonomy(t, 0.1, 0.1, 1)
f = sim.fossils.intervals(taxonomy = s, interval.ages = times, rates = rates)
plot(f, t, interval.ages = times, show.strata = TRUE)




