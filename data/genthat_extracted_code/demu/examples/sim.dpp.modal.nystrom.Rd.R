library(demu)


### Name: sim.dpp.modal.nystrom
### Title: Draw samples from the conditional DPP design emulator using
###   grid-based Nystrom approximation.
### Aliases: sim.dpp.modal.nystrom

### ** Examples

library(demu)

# Starting design
X=matrix(runif(10*2),ncol=2)
rho=rep(0.01,2)
n=10
ngrid=11
samp=sim.dpp.modal.nystrom(X,rho,n,ngrid)

# Could plot the result:
# plot(samp$X,xlim=c(0,1),ylim=c(0,1))
# points(samp$X[samp$pts,],pch=20)



