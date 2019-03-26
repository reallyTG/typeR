library(ratematrix)


### Name: makePrior
### Title: Generate prior distributions for the multivariate Brownian
###   motion model
### Aliases: makePrior

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
## The proposal step on the standard deviation is a multiplier. So 0.2 is good enough for 
##     most cases.
w_sd <- matrix(0.2, ncol = 2, nrow = 2)
prior <- makePrior(r = 2, p = 2, den.mu = "unif", par.mu = data.range, den.sd = "unif"
                   , par.sd = par.sd)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, prior=prior
                         , gen=50000, w_mu=w_mu, w_sd=w_sd, dir=tempdir())
posterior <- readMCMC(handle, burn = 0.2, thin = 10)
plotRatematrix( posterior )
## End(No test)



