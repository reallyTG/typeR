library(fDMA)


### Name: dmtest
### Title: Computes Diebold-Mariano Test.
### Aliases: dmtest

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D m <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10)
##D m <- m$y.hat
##D a <- altf2(y=ld.wti,x=ld.drivers,d=TRUE)
##D a <- a$y.hat
##D a <- matrix(unlist(a),nrow=length(a),byrow=TRUE)
##D fc <- rbind(m,a)
##D dm <- dmtest(y=as.vector(ld.wti),f=fc)
## End(Not run)



