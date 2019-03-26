library(isingLenzMC)


### Name: isPerform1D
### Title: Perform metropolis MC on 1D Ising model
### Aliases: isPerform1D

### ** Examples

  n        <- 10 # 10 spin sites
  mySites  <- genConfig1D(n) # Generate sites
  output   <- isPerform1D(1.0, mySites, 1.0, 0.0, 10, 0.5, 1) # Metropolis
  output   <- isPerform1D(1.0, mySites, 1.0, 0.0, 10, 0.5, 2) # Glauber



