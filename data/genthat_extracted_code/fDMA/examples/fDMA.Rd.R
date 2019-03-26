library(fDMA)


### Name: fDMA
### Title: Computes Dynamic Model Averaging.
### Aliases: fDMA

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10)
##D m2 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,model="dms")
##D m3 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,V.meth="ewma",kappa=0.9)
##D m4 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,DOW=0.7)
## End(Not run)
## Don't show: 
s <- ld.drivers[1:20,1:4]
mod1 <- fDMA(y=ld.wti[1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10)
mod2 <- fDMA(y=ld.wti[1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10,model="dms")
mod3 <- fDMA(y=ld.wti[1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10,V.meth="ewma",kappa=0.9)
mod4 <- fDMA(y=ld.wti[1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10,DOW=0.7)
## End(Don't show)
# Google trends are available since 2004
## Not run: 
##D gp <- trends/100
##D s <- ld.drivers['2004-01-01/']
##D m5 <- fDMA(y=ld.wti['2004-01-01/'],x=s,alpha=0.99,lambda=0.90,initvar=10,gprob=gp,omega=0.5)
## End(Not run)
## Don't show: 
s <- ld.drivers['2004-01-01/'][1:20,1:4]
gp <- trends/100
gp <- gp[1:20,1:4]
mod5 <- fDMA(y=ld.wti['2004-01-01/'][1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10,gprob=gp,omega=0.5)
## End(Don't show)
# models just with one independent variable and a constant will be averaged
mds <- diag(1,ncol(ld.drivers),ncol(ld.drivers))
mds <- cbind(rep(1,ncol(ld.drivers)),mds)
## Not run: 
##D m6 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,mods.incl=mds)
## End(Not run)
## Don't show: 
s <- ld.drivers[1:20,1:4]
mod6 <- fDMA(y=ld.wti[1:20,1],x=s,alpha=0.99,lambda=0.90,initvar=10,mods.incl=mds[1:5,1:5])
## End(Don't show)
# models just with one independent variable (without a constant) will be averaged
mds.nc <- diag(1,ncol(ld.drivers),ncol(ld.drivers))
mds.nc <- cbind(rep(0,ncol(ld.drivers)),mds.nc)
## Not run: 
##D m7 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,mods.incl=mds.nc)
## End(Not run)
# model with multiple lambda
## Not run: 
##D m8 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=c(0.99,0.95,0.90),initvar=10)
## End(Not run)



