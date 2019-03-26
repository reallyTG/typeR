library(fDMA)


### Name: onevar
### Title: Creates a 'matrix' of one-variable models.
### Aliases: onevar

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D 
##D mds <- diag(1,ncol(ld.drivers),ncol(ld.drivers))
##D mds <- cbind(rep(1,ncol(ld.drivers)),mds)
##D mds <- rbind(rep(0,ncol(mds)),mds)
##D mds[1,1] <- 1
##D 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,mods.incl=mds)
##D 
##D # Equivalently: 
##D 
##D m2 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10,mods.incl=onevar(ld.drivers))
## End(Not run)



