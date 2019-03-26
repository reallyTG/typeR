library(isingLenzMC)


### Name: transitionProbability1D_R
### Title: Compute transition probability using Boltzmann distribution.
### Aliases: transitionProbability1D_R

### ** Examples

  n             <- 10 # 10 spin sites
  mySites       <- genConfig1D_R(n) # Generate sites
  mySitesNew    <- flipConfig1D_R(mySites)
  # only short-range part
  transitionProbability1D_R(1.0, mySites, mySitesNew, 1.0, 0.0)



