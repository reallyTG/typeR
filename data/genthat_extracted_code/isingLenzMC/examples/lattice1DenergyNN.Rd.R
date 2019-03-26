library(isingLenzMC)


### Name: lattice1DenergyNN
### Title: Nearest-Neighbour energy in periodic boundary conditions in 1D
### Aliases: lattice1DenergyNN

### ** Examples

  n          <- 10 # 10 spin sites
  mySites    <- genConfig1D(n) # Generate sites
  # now flip 
  mySitesNew <- lattice1DenergyNN(mySites)



