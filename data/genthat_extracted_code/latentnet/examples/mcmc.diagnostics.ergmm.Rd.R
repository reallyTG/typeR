library(latentnet)


### Name: mcmc.diagnostics.ergmm
### Title: Conduct MCMC diagnostics on an ERGMM fit
### Aliases: mcmc.diagnostics.ergmm mcmc.diagnostics
### Keywords: debugging graphs hplot

### ** Examples


## No test: 
#
data(sampson)
#
# test the mcmc.diagnostics function
#
gest <- ergmm(samplike ~ euclidean(d=2),
              control=ergmm.control(burnin=1000,interval=5))
summary(gest)
#
# Plot the traces and densities
#
mcmc.diagnostics(gest)
## End(No test)




