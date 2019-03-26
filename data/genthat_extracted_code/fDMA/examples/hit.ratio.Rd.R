library(fDMA)


### Name: hit.ratio
### Title: Computes Hit Ratio (HR) for Forecast.
### Aliases: hit.ratio

### ** Examples

wti <- crudeoil[-1,1]
drivers <- (lag(crudeoil[,-1],k=1))[-1,]
ld.wti <- (diff(log(wti)))[-1,]
ld.drivers <- (diff(log(drivers)))[-1,]
## Not run: 
##D m1 <- fDMA(y=wti,x=drivers,alpha=0.99,lambda=0.99,initvar=10)
##D hit.ratio(y=wti,y.hat=m1$y.hat)
##D 
##D m2 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.99,initvar=10)
##D hit.ratio(y=ld.wti,y.hat=m2$y.hat,d=TRUE)
## End(Not run)
## Don't show: 
m1 <- fDMA(y=wti[1:20,1],x=drivers[1:20,1:4],alpha=0.99,lambda=0.99,initvar=10)
hit.ratio(y=wti[1:20,1],y.hat=m1$y.hat)

m2 <- fDMA(y=ld.wti[1:20,1],x=ld.drivers[1:20,1:4],alpha=0.99,lambda=0.99,initvar=10)
hit.ratio(y=ld.wti[1:20,1],y.hat=m2$y.hat,d=TRUE)
## End(Don't show)



