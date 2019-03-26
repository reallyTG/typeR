library(ratematrix)


### Name: ratematrixJointMCMC
### Title: Estimate the evolutionary rate matrix together with the regimes
###   using Markov-chain Monte Carlo
### Aliases: ratematrixJointMCMC

### ** Examples

## No test: 
data( centrarchidae )
## Set the limits of the uniform prior on the root based on the observed traits
data.range <- t( apply( centrarchidae$data, 2, range ) )
## The step size for the root value can be set given the range we need to sample from:
w_mu <- ( data.range[,2] - data.range[,1] ) / 10
## Set a reasonable value for the uniform prior distribution for the standard deviation.
## Here the minimum rate for the traits is 0 and the maximum is 10 ( using 'sqrt(10)' to 
##      transform to standard deviation).
par.sd <- cbind(c(0,0), sqrt( c(10,10) ))
## The proposal step on the standard deviation is a multiplier. So 0.2 is good enough 
##       for most cases.
w_sd <- matrix(0.2, ncol = 2, nrow = 2)
prior <- makePrior(r = 2, p = 2, den.mu = "unif", par.mu = data.range, den.sd = "unif"
                   , par.sd = par.sd)
## Run multiple MCMC chains.
handle.list <- lapply(1:4, function(x) ratematrixMCMC(data=centrarchidae$data
                      , phy=centrarchidae$phy.map, prior=prior, gen=10000
                      , w_mu=w_mu, w_sd=w_sd, dir=tempdir()) )
## Read all to a list
posterior.list <- lapply(handle.list, readMCMC)
## Check for convergence (it might not converge with only 10000 steps)
checkConvergence(posterior.list)
## Merge all posteriors in the list.
merged.posterior <- mergePosterior(posterior.list)
## PLot results:
plotRatematrix(merged.posterior)
plotRootValue(merged.posterior)
## End(No test)



