library(ptycho)


### Name: checkConvergence
### Title: Compute Differences Between MCMC Chains
### Aliases: checkConvergence

### ** Examples

data(ptychoOut)
cvg <- checkConvergence(ptychoOut, doLastIterOnly=FALSE)
reshape2::dcast(cvg, ... ~ iter, value.var="range")



