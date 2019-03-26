library(RcppSMC)


### Name: blockpfGaussianOpt
### Title: Block Sampling Particle Filter (Linear Gaussian Model; Optimal
###   Proposal)
### Aliases: blockpfGaussianOpt simGaussian
### Keywords: programming

### ** Examples

  sim <- simGaussian(len=250)
  res <- blockpfGaussianOpt(sim$data,lag=5,plot=TRUE)



