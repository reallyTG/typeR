library(demu)


### Name: sim.dpp.modal.np
### Title: Draw samples from the conditional DPP design emulator using a
###   kmeans-based Nystrom approximation.
### Aliases: sim.dpp.modal.np

### ** Examples

library(demu)

n=50
p=5
N=500
rho=rep(0.01,5)
samp=sim.dpp.modal.np(n,p,N,rho)

# Could plot the result:
# pchvec=rep(1,nrow(samp$X))
# pchvec[samp$pts]=20
# cexvec=rep(0.1,nrow(samp$X))
# cexvec[samp$pts]=1
# colvec=rep("black",nrow(samp$X))
# colvec[samp$pts]="red"
# pairs(samp$X,pch=pchvec,cex=cexvec,col=colvec,xlim=c(0,1),ylim=c(0,1))



