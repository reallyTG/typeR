library(mstate)


### Name: expand.covs.msdata
### Title: Expand covariates in multi-state dataset in long format
### Aliases: expand.covs.msdata
### Keywords: datagen

### ** Examples

# transition matrix for illness-death model
tmat <- trans.illdeath()
# small data set in wide format
tg <- data.frame(illt=c(1,1,6,6,8,9),ills=c(1,0,1,1,0,1),
        dt=c(5,1,9,7,8,12),ds=c(1,1,1,1,1,1),
        x1=c(1,1,1,2,2,2),x2=c(6:1))
tg$x1 <- factor(tg$x1,labels=c("male","female"))
# data in long format using msprep
tglong <- msprep(time=c(NA,"illt","dt"),
        status=c(NA,"ills","ds"),data=tg,
        keep=c("x1","x2"),trans=tmat)
# expanded covariates
expand.covs(tglong,c("x1","x2"),append=FALSE)
expand.covs(tglong,"x1")
expand.covs(tglong,"x1",longnames=FALSE)



