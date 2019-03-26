library(fDMA)


### Name: altf2
### Title: Computes a Few Alternative Forecasts Based on Model Averaging.
### Aliases: altf2

### ** Examples

## Not run: 
##D # models for untransformed data
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a1 <- altf2(y=wti,x=drivers)
##D 
##D # do not include first 12 observations for forecast quality measures,
##D # i.e., treat first 12 observations as a ''training set''
##D a2 <- altf2(y=wti,x=drivers,initial.period=12)
##D 
##D # models for log-differenced data
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D a3 <- altf2(y=ld.wti,x=ld.drivers,d=TRUE)
##D 
##D fcomp <- c(TRUE,TRUE,TRUE,FALSE)
##D a4 <- altf2(y=ld.wti,x=ld.drivers,d=TRUE,f=fcomp)
##D a5 <- altf2(y=ld.wti,x=ld.drivers,d=TRUE,f=fcomp,av="aic")
##D 
##D m1 <- fDMA(y=ld.wti,x=ld.drivers,alpha=0.99,lambda=0.90,initvar=10)
##D a6 <- altf2(y=ld.wti,x=ld.drivers,d=TRUE,f=fcomp,fmod=m1)
##D 
##D # models just with one independent variable and a constant will be averaged
##D mds <- diag(1,ncol(ld.drivers),ncol(ld.drivers))
##D mds <- cbind(rep(1,ncol(ld.drivers)),mds)
##D a7 <- altf2(y=ld.wti,x=ld.drivers,d=TRUE,mods.incl=mds)
##D 
##D # Google trends are available since 2004
##D gp <- trends/100
##D s1 <- ld.wti['2004-01-01/']
##D s2 <- ld.drivers['2004-01-01/']
##D a8 <- altf2(y=s1,x=s2,d=TRUE,gprob=gp,omega=0.5)
## End(Not run)



