library(demu)


### Name: sim.dpp.modal.seq
### Title: Draw sequential samples from the conditional DPP given
###   previously sampled points already in the design.
### Aliases: sim.dpp.modal.seq

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

# Next sequential step, removing projections
pts.2=sim.dpp.modal.seq(pts.1.proj$allpts,R,n2)
design=c(pts.1,pts.2$pts.new)
pts.2.proj=remove.projections(design,X)

# Next sequential step, removing projections
pts.3=sim.dpp.modal.seq(pts.2.proj$allpts,R,n3)
design=c(design,pts.3$pts.new)


# Or, starting with the initial design, don't remove projections
pts.2=sim.dpp.modal.seq(pts.1,R,n2)
designB=c(pts.1,pts.2$pts.new)

pts.3=sim.dpp.modal.seq(designB,R,n3)
designB=c(designB,pts.3$pts.new)


# Plot the result:
#par(mfrow=c(1,3))
#plot(X,xlim=c(0,1),ylim=c(0,1),main="Initial Design")
#points(X[pts.1,],pch=20,cex=2)
#
#plot(X,xlim=c(0,1),ylim=c(0,1),main="+3x2 remove projections")
#points(X[design,],pch=20,cex=2)
#
#plot(X,xlim=c(0,1),ylim=c(0,1),main="+3x2 not removing projections")
#points(X[designB,],pch=20,cex=2)



