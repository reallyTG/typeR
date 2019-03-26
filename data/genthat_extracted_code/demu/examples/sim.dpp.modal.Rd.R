library(demu)


### Name: sim.dpp.modal
### Title: Draw samples from the conditional DPP design emulator.
### Aliases: sim.dpp.modal

### ** Examples

library(demu)

# candidate grid
ngrid=20
x=seq(0,1,length=ngrid)
X=as.matrix(expand.grid(x,x))
l.d=makedistlist(X)

# draw design from DPP mode
n=21
rho=0.01
R=rhomat(l.d,rep(rho,2))$R
pts=sim.dpp.modal(R,n)

# Could plot the result:
# plot(X,xlim=c(0,1),ylim=c(0,1))
# points(X[pts,],pch=20)



