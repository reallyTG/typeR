library(isingLenzMC)


### Name: isStep1D
### Title: Carry one step Metropolis Monte Carlo on 1D ising model
### Aliases: isStep1D

### ** Examples

  n             <- 10 # 10 spin sites
  mySites       <- genConfig1D(n) # Generate sites
  # only short-range part
  isStep1D(1.0, mySites, 1.0, 0.0, 1) # Metropolis
  isStep1D(1.0, mySites, 1.0, 0.0, 2) # Glauber



