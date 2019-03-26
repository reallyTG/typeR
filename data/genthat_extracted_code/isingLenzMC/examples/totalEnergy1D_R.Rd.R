library(isingLenzMC)


### Name: totalEnergy1D_R
### Title: Total energy in periodic boundary conditions in 1D
### Aliases: totalEnergy1D_R

### ** Examples

  n             <- 10 # 10 spin sites
  mySites       <- genConfig1D_R(n) # Generate sites
  # only short-range part
  myTotalEnergy <- totalEnergy1D_R(mySites, 1.0, 0.0)



