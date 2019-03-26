library(fDMA)


### Name: tvp
### Title: Computes Time-Varying Parameters Regression.
### Aliases: tvp

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D t1 <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99)
## End(Not run)
## Don't show: 
tt1 <- tvp(y=ld.wti[1:20,1],x=ld.drivers[1:20,1:4],V=1,lambda=0.99)
## End(Don't show)
## Not run: 
##D t2 <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99,W=1)
## End(Not run)
## Don't show: 
tt2 <- tvp(y=ld.wti[1:20,1],x=ld.drivers[1:20,1:4],V=1,lambda=0.99,W=1)
## End(Don't show)
## Not run: 
##D t3 <- tvp(y=ld.wti,x=ld.drivers,V=1,lambda=0.99,W=1,kappa=0.75)
## End(Not run)
## Don't show: 
tt3 <- tvp(y=ld.wti[1:20,1],x=ld.drivers[1:20,1:4],V=1,lambda=0.99,W=1,kappa=0.75)
## End(Don't show)
# Model with constant only
empty <- matrix(,nrow=nrow(ld.drivers),ncol=0)
t4 <- tvp(y=ld.wti,x=empty,lambda=0.99,V=1)



