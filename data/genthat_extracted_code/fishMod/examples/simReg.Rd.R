library(fishMod)


### Name: simReg
### Title: Simulate Poisson-Gamma data whose component means vary with
###   covariates.
### Aliases: simReg simReg
### Keywords: misc

### ** Examples

sim.dat <- simReg( n=250, lambda.tau=c(0.6, 1.2, 0), mu.Z.tau=c(-0.3, 0, -0.5), alpha=0.85, X=NULL)
print( head( sim.dat))



