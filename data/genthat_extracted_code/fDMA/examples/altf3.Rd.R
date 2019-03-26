library(fDMA)


### Name: altf3
### Title: Computes a Rolling Regression Averaged over Different Window
###   Sizes.
### Aliases: altf3

### ** Examples

## Not run: 
##D # models for untransformed data
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a1 <- altf3(y=wti,x=drivers,windows=c(36,100,150))
##D 
##D # do not include first 12 observations for forecast quality measures,
##D # i.e., treat first 12 observations as a ''training set''
##D a2 <- altf3(y=wti,x=drivers,initial.period=12,windows=c(36,100,150))
##D 
##D # models for log-differenced data
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D a3 <- altf3(y=ld.wti,x=ld.drivers,d=TRUE,windows=c(36,100,150))
##D 
##D a4 <- altf3(y=ld.wti,x=ld.drivers,d=TRUE,av="aic",windows=c(36,100,150))
##D 
##D a5 <- altf3(y=ld.wti,x=ld.drivers,d=TRUE,av=-2,windows=c(36,100,150))
##D 
##D # models without a constant term 
##D a6 <- altf3(y=ld.wti,x=ld.drivers,d=TRUE,av=-2,windows=c(36,100,150),c=FALSE)
##D 
##D # models only with a constant term
##D a7 <- altf3(y=ld.wti,d=TRUE,av=-2,windows=c(36,100,150))
## End(Not run)



