library(mstate)


### Name: expand.covs
### Title: Expand covariates in competing risks dataset in stacked format
### Aliases: expand.covs expand.covs.default
### Keywords: datagen

### ** Examples

# small data set in stacked format
tg <- data.frame(time=c(5,5,1,1,9,9),status=c(1,0,2,2,0,1),failcode=rep(c("I","II"),3),
        x1=c(1,1,2,2,2,2),x2=c(3,3,2,2,1,1))
tg$x1 <- factor(tg$x1,labels=c("male","female"))
# expanded covariates
expand.covs(tg,covs=c("x1","x2"))
expand.covs(tg,covs=c("x1","x2"),longnames=TRUE)
expand.covs(tg,covs=c("x1","x2"),append=FALSE)



