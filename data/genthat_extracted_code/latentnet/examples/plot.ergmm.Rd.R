library(latentnet)


### Name: plot.ergmm
### Title: Plotting Method for class ERGMM
### Aliases: plot.ergmm plot3d.ergmm
### Keywords: graphs hplot

### ** Examples


## No test: 
#
# Using Sampson's Monk data, let's fit a 
# simple latent position model
#
data(sampson)
#
# Using Sampson's Monk data, let's fit a
# latent clustering random effects model
# Store the burn-in.
samp.fit <- ergmm(samplike ~ euclidean(d=2, G=3)+rreceiver,
                  control=ergmm.control(store.burnin=TRUE))
#
# See if we have convergence in the MCMC
mcmc.diagnostics(samp.fit)
# We can also plot the burn-in:
for(i in samp.fit$control$pilot.runs) mcmc.diagnostics(samp.fit,burnin=i)
#
# Plot the resulting fit.
#
plot(samp.fit,labels=TRUE,rand.eff="receiver")
plot(samp.fit,pie=TRUE,rand.eff="receiver")
plot(samp.fit,what="pmean",rand.eff="receiver")
plot(samp.fit,what="cloud",rand.eff="receiver")
plot(samp.fit,what="density",rand.eff="receiver")
plot(samp.fit,what=5,rand.eff="receiver")

## Not run: 
##D # Fit a 3D latent space model to Sampson's Monks
##D samp.fit3 <- ergmm(samplike ~ euclidean(d=3))
##D 
##D # Plot the first two principal components of the
##D # latent space positions
##D plot(samp.fit,use.rgl=FALSE)
##D # Plot the resulting fit in 3D
##D plot(samp.fit,use.rgl=TRUE)
## End(Not run)
## End(No test)



