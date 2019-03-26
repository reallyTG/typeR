library(RcppSMC)


### Name: pfNonlinBS
### Title: Nonlinear Bootstrap Particle Filter (Univariate Non-Linear State
###   Space Model)
### Aliases: pfNonlinBS
### Keywords: programming

### ** Examples

  sim <- simNonlin(len=50)
  res <- pfNonlinBS(sim$data,particles=500,plot=TRUE)



