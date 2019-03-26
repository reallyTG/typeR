library(valorate)


### Name: valorate.plot.empirical
### Title: PLOT THE SAMPLED (EMPIRICAL) LOG-RANK DISTRIBUTION
### Aliases: valorate.plot.empirical

### ** Examples

## Create a random population of 100 subjects 
## having 20 events
subjects <- numeric(100)
subjects[sample(100,20)] <- 1
vo <- new.valorate(rank=subjects, sampling.size=100000, verbose=TRUE)

groups <- numeric(100)
groups[sample(100,4)] <- 1  # only 4 subjects are within the 'mutated' group
pvr <- valorate.survdiff(vo, groups) 
print(pvr)

# Crude density
## Not run: valorate.plot.empirical(vo, 4)

# Similar but marking the statistic 
# returned by groups and shading
## Not run: valorate.plot.empirical(vo, groups)

# Plot density and check symmetry
## Not run: valorate.plot.empirical(vo, 4, 0)

# Now should be almost symmetric
## Not run: valorate.plot.empirical(vo, 50, 0)

# Crude density plus gaussian, weibull, and beta estimations
## Not run: valorate.plot.empirical(vo, 4, include="all", legends=TRUE)




