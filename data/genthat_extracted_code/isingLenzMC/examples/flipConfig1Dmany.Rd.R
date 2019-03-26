library(isingLenzMC)


### Name: flipConfig1Dmany
### Title: Flip a single site randomly many times
### Aliases: flipConfig1Dmany

### ** Examples

  n          <- 10 # 10 spin sites
  mySites    <- genConfig1D(n) # Generate sites
  # now flip 100 times
  mySitesNew <- flipConfig1Dmany(mySites, 100)



