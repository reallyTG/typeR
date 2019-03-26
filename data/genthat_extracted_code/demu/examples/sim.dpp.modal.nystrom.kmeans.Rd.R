library(demu)


### Name: sim.dpp.modal.nystrom.kmeans
### Title: Subsample an observational dataset using the conditional DPP
###   design emulator with a kmeans-based Nystrom approximation.
### Aliases: sim.dpp.modal.nystrom.kmeans

### ** Examples

library(demu)

# Fake dataset in 5 dimensions
X=matrix(runif(500*5),ncol=5)
rho=rep(0.01,5)
n=50
samp=sim.dpp.modal.nystrom.kmeans(X,n,rho)

# Could plot the result:
# pchvec=rep(1,nrow(samp$X))
# pchvec[samp$pts]=20
# cexvec=rep(0.1,nrow(samp$X))
# cexvec[samp$pts]=1
# colvec=rep("black",nrow(samp$X))
# colvec[samp$pts]="red"
# pairs(samp$X,pch=pchvec,cex=cexvec,col=colvec,xlim=c(0,1),ylim=c(0,1))



