library(fDMA)


### Name: altf4
### Title: Computes a Time-Varying Parameters Rolling Regression Averaged
###   over Different Window Sizes.
### Aliases: altf4

### ** Examples

## Not run: 
##D # models for untransformed data
##D wti <- crudeoil[-1,1]
##D drivers <- (lag(crudeoil[,-1],k=1))[-1,]
##D a1 <- altf4(y=wti,x=drivers,windows=c(36,100,150))
##D 
##D # do not include first 12 observations for forecast quality measures,
##D # i.e., treat first 12 observations as a ''training set''
##D a2 <- altf4(y=wti,x=drivers,initial.period=12,windows=c(36,100,150))
##D 
##D # models for log-differenced data
##D ld.wti <- (diff(log(wti)))[-1,]
##D ld.drivers <- (diff(log(drivers)))[-1,]
##D a3 <- altf4(y=ld.wti,x=ld.drivers,d=TRUE,windows=c(36,100,150))
##D 
##D win <- c(36,100,150)
##D a4 <- altf4(y=ld.wti,x=ld.drivers,d=TRUE,windows=win,alpha=0.9,lambda=0.95)
##D 
##D # models without a constant term
##D a5 <- altf4(y=ld.wti,x=ld.drivers,d=TRUE,windows=win,alpha=0.9,lambda=0.95,c=FALSE)
##D 
##D # models only with a constant term
##D empty <- matrix(,nrow=nrow(ld.drivers),ncol=0)
##D a6 <- altf4(y=ld.wti,x=empty,d=TRUE,windows=win,alpha=0.9,lambda=0.95)
## End(Not run)



