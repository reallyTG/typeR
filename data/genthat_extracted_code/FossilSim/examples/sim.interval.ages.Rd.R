library(FossilSim)


### Name: sim.interval.ages
### Title: Reassign fossil ages to user-specified stratigraphic intervals
### Aliases: sim.interval.ages

### ** Examples

# simulate tree
t = ape::rtree(8)

# simulate fossils
rate = 2
f = sim.fossils.poisson(rate, t)
plot(f, t)

# assign a max age based on tree height
max.age = tree.max(t)

# define intervals
times = seq(0, max.age, length.out = 5)

# reassign ages
f = sim.interval.ages(f, t, interval.ages = times)

# plot output
plot(f, t, interval.ages = times)




