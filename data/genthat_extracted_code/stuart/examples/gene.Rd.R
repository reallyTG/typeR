library(stuart)


### Name: gene
### Title: Subtest construction using a simple genetic algorithm
### Aliases: gene

### ** Examples


# Genetic selection in a simple situation
# requires lavaan
# number of cores set to 1 in all examples
data(fairplayer)
fs <- list(si = names(fairplayer)[83:92])

# minimal example
sel <- gene(fairplayer, fs, 4, 
  generations = 1, individuals = 10,  # minimal runtime, remove for application
  seed = 55635, cores = 1)
summary(sel)

## No test: 
# longitudinal example
data(fairplayer)
fs <- list(si1 = names(fairplayer)[83:92],
  si2 = names(fairplayer)[93:102],
  si3 = names(fairplayer)[103:112])

repe <- list(si = c('si1', 'si2', 'si3'))

# run to convergence
# switching to best-last mating and 50% mating size
sel <- gene(fairplayer, fs, 4, 
  repeated.measures = repe, long.invariance = 'strong',
  mating.index = 0, mating.size = .5,
  seed = 55635, cores = 1)

# forcing a run through all generations
# by disabling the variance convergence rule
sel <- gene(fairplayer, fs, 4,
  repeated.measures = repe, long.invariance = 'strong',
  tolerance = 0, seed = 55635,
  cores = 1)
## End(No test)




