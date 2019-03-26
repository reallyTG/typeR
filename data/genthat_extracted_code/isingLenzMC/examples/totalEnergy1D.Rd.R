library(isingLenzMC)


### Name: totalEnergy1D
### Title: Total energy in periodic boundary conditions in 1D
### Aliases: totalEnergy1D

### ** Examples

  n             <- 10 # 10 spin sites
  mySites       <- genConfig1D(n) # Generate sites
  # only short-range part
  myTotalEnergy <- totalEnergy1D(mySites, 1.0, 0.0)



