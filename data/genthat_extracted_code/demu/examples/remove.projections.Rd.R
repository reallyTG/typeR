library(demu)


### Name: remove.projections
### Title: Identify candidate points making up all marginal subprojections
###   of an existing design.
### Aliases: remove.projections

### ** Examples

library(demu)

n1=3
n2=3
n3=3
rho=rep(1e-10,2)
ngrid=10

x=seq(0,1,length=ngrid)
X=as.matrix(expand.grid(x,x))
l.d=makedistlist(X)

# Initial design
R=rhomat(l.d,rho)$R
pts.1=sim.dpp.modal(R,n1)
pts.1.proj=remove.projections(pts.1,X)

# Plot - design points in black, design+projection points in grey.
#plot(X,xlim=c(0,1),ylim=c(0,1))
#points(X[pts.1.proj$projpts,],pch=20,cex=2,col="grey")
#points(X[pts.1,],pch=20,cex=2)



