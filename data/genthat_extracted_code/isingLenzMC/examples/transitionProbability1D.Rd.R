library(isingLenzMC)


### Name: transitionProbability1D
### Title: Compute transition probability using Boltzmann distribution.
### Aliases: transitionProbability1D

### ** Examples

  n             <- 10             # 10 spin sites
  mySites       <- genConfig1D(n) # Generate sites
  mySitesNew    <- flipConfig1D(mySites)
  # only short-range part
  transitionProbability1D(1.0, mySites, mySitesNew, 1.0, 0.0, 1) # Metropolis
  transitionProbability1D(1.0, mySites, mySitesNew, 1.0, 0.0, 2) # Glauber



