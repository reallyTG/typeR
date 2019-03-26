library(simEd)


### Name: galileo
### Title: Monte Carlo Simulation of Galileo's Dice
### Aliases: galileo
### Keywords: misc

### ** Examples

  # set the initial seed externally using set.seed;
  # then use that current state of the generator with default nrep = 1000
  set.seed(8675309)
  galileo()  # uses state of generator set above

  # explicitly set the seed in the call to the function,
  # using default nrep = 1000
  galileo(seed = 8675309)

  # use the current state of the random number generator with nrep = 10000
  probs <- galileo(10000)

  # explicitly set nrep = 10000 and seed = 8675309
  probs <- galileo(10000, 8675309)



