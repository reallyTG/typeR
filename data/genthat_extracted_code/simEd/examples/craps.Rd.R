library(simEd)


### Name: craps
### Title: Monte Carlo Simulation of the Dice Game "Craps"
### Aliases: craps
### Keywords: misc

### ** Examples

  # set the initial seed externally using set.seed;
  # then use that current state of the generator with default nrep = 1000
  set.seed(8675309)
  craps()  # uses state of generator set above

  # explicitly set the seed in the call to the function,
  # using default nrep = 1000
  craps(seed = 8675309)

  # use the current state of the random number generator with nrep = 10000
  prob <- craps(10000)

  # explicitly set nrep = 10000 and seed = 8675309
  probs <- craps(10000, 8675309)



