library(demu)


### Name: sim.dpp.modal.fast
### Title: Draw samples from the conditional DPP design emulator.
### Aliases: sim.dpp.modal.fast

### ** Examples

library(demu)
library(fields)
library(spam)
library(Matrix)
library(Rcpp)

# candidate grid
ngrid=20
x=seq(0,1,length=ngrid)
X=as.matrix(expand.grid(x,x))

# draw design from DPP mode
n=21
theta=0.39
R.spam=wendland.cov(X,X,theta=theta,k=3) 
R=as.dgCMatrix.spam(R.spam)
rm(R.spam)
pts=sim.dpp.modal.fast(R,n)

# Could plot the result:
# plot(X,xlim=c(0,1),ylim=c(0,1))
# points(X[pts,],pch=20)



