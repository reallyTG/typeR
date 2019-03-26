library(fDMA)


### Name: stest
### Title: Computes a Few Stationarity Tests.
### Aliases: stest

### ** Examples

## Not run: 
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D x <- cbind(ld.wti,ld.drivers)
##D stest(x)
## End(Not run)



