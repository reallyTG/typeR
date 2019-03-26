library(fDMA)


### Name: altf
### Title: Computes a Few Alternative Forecasts.
### Aliases: altf

### ** Examples

## Not run: 
##D # models for untransformed data
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a1 <- altf(y=wti,x=drivers)
##D 
##D # do not include first 12 observations for forecast quality measures,
##D # i.e., treat first 12 observations as a ''training set''
##D a2 <- altf(y=wti,x=drivers,initial.period=12)
##D 
##D # models for log-differenced data
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D a3 <- altf(y=ld.wti,x=ld.drivers,d=TRUE)
##D 
##D # models where constant term is not included in modelled equations (if applicable)
##D a4 <- altf(y=ld.wti,x=ld.drivers,d=TRUE,c=FALSE)
##D 
##D # compute just selected models
##D fcomp <- c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,FALSE)
##D a5 <- altf(y=ld.wti,x=ld.drivers,d=TRUE,f=fcomp)
##D 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10)
##D a6 <- altf(y=ld.wti,x=ld.drivers,d=TRUE,f=fcomp,fmod=m1)
## End(Not run)



