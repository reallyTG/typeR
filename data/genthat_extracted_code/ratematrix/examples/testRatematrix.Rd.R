library(ratematrix)


### Name: testRatematrix
### Title: Test for difference between evolutionary rate matrix estimates
### Aliases: testRatematrix

### ** Examples

## No test: 
data( centrarchidae )
dt.range <- t( apply( centrarchidae$data, 2, range ) )
## The step size for the root value can be set given the range we need to sample from:
w_mu <- ( dt.range[,2] - dt.range[,1] ) / 10
par.sd <- cbind(c(0,0), sqrt( c(1,1) ))
prior <- makePrior(r=2, p=2, par.mu=dt.range, par.sd=par.sd)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, prior=prior
                         , gen=50000, w_mu=w_mu, dir=tempdir())
posterior <- readMCMC(handle, burn = 0.2, thin = 10)
testRatematrix(posterior, par = "all")
testRatematrix(posterior, par = "correlation")
testRatematrix(posterior, par = "rates")
testRatematrix(posterior, par = "correlation", plot = TRUE)
## End(No test)



