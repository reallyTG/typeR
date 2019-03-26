library(HPbayes)


### Name: dens.prior
### Title: Density of the prior
### Aliases: dens.prior
### Keywords: misc

### ** Examples

#Generate a prior distribution
pri.lo = c(0, 0, 0, 0, 0, 15, 0, 0)
pri.hi = c(0.15, 1, 1, 0.25, 15, 55, 0.1, 1.25)
B0 <- 8000
q0 <- cbind(runif(B0, pri.lo[1], pri.hi[1]), 
runif(B0, pri.lo[2], pri.hi[2]), 
runif(B0, pri.lo[3], pri.hi[3]), 
runif(B0, pri.lo[4], pri.hi[4]), 
runif(B0, pri.lo[5], pri.hi[5]), 
runif(B0, pri.lo[6], pri.hi[6]), 
runif(B0, pri.lo[7], pri.hi[7]), 
runif(B0, pri.lo[8], pri.hi[8]))

density <- dens.prior(x=q0)




