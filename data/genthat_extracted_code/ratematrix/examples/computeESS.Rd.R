library(ratematrix)


### Name: computeESS
### Title: Compute the ESS for the MCMC samples
### Aliases: computeESS

### ** Examples

## No test: 
data( centrarchidae )
dt.range <- t( apply( centrarchidae$data, 2, range ) )
## The step size for the root value can be set given the range we need to sample from:
w_mu <- ( dt.range[,2] - dt.range[,1] ) / 10
par.sd <- cbind(c(0,0), sqrt( c(10,10) ))
prior <- makePrior(r=2, p=2, den.mu="unif", par.mu=dt.range, den.sd="unif", par.sd=par.sd)
prior.samples <- samplePrior(n = 1000, prior = prior)
start.point <- samplePrior(n=1, prior=prior)
## Plot the prior. Red line shows the sample from the prior that will set the 
##      starting point for the MCMC.
plotRatematrix(prior.samples, point.matrix = start.point$matrix, point.color = "red"
               , point.wd = 2)
plotRootValue(prior.samples)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, prior=prior
                         , gen=10000, w_mu=w_mu, dir=tempdir())
posterior <- readMCMC(handle, burn = 0.2, thin = 10)
## Again, here the red line shows the starting point of the MCMC.
plotRatematrix( posterior, point.matrix = start.point$matrix, point.color = "red"
               , point.wd = 2)
plotRootValue(posterior)
computeESS(mcmc=posterior, p=2)
## End(No test)



