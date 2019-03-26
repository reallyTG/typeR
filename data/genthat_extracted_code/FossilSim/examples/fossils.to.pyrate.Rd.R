library(FossilSim)


### Name: fossils.to.pyrate
### Title: Generate output in the format used by the program PyRate
### Aliases: fossils.to.pyrate

### ** Examples


set.seed(123)

# simulate tree
t = ape::rtree(6)

# assign a max age based on tree height
max.age = tree.max(t)

# define a set of non-uniform length intervals
times = c(0, sort(runif(3, min = 0, max = max.age)), max.age)
rates = c(1,2,3,4)

# simulate fossils reflect age uncertainty
f = sim.fossils.intervals(tree = t, interval.ages = times, rates = rates,
    use.exact.times = FALSE)

# simulate extant samples
rho = 1
f = sim.extant.samples(f, t, rho = 1)

plot(f, t)

# generate input files for pyrate
fossils.to.pyrate(f)
fossils.to.pyrate(f, python = FALSE)

# add trait values
traits = runif(length(unique(f$sp)))
fossils.to.pyrate(f, traits = traits)




