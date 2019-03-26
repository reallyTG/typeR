library(latentnet)


### Name: ergmm
### Title: Fit a Latent Space Random Graph Model
### Aliases: ergmm latent latentcluster
### Keywords: graphs

### ** Examples


## No test: 
#
# Use 'data(package = "latentnet")' to list the data sets in a
#
data(package="latentnet")
#
# Using Sampson's Monk data, lets fit a 
# simple latent position model
#
data(sampson)
samp.fit <- ergmm(samplike ~ euclidean(d=2))
#
# See if we have convergence in the MCMC
mcmc.diagnostics(samp.fit)
#
# Plot the fit
#
plot(samp.fit)
#
# Using Sampson's Monk data, lets fit a latent clustering random effects model
#
samp.fit2 <- ergmm(samplike ~ euclidean(d=2, G=3)+rreceiver)
#
# See if we have convergence in the MCMC
mcmc.diagnostics(samp.fit2)
#
# Plot the fit.
#
plot(samp.fit2, pie=TRUE)
## End(No test)



