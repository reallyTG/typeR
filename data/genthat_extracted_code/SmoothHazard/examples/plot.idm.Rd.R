library(SmoothHazard)


### Name: plot.idm
### Title: Plot method for an illness-death model
### Aliases: plot.idm
### Keywords: methods

### ** Examples


library(lava)
library(prodlim)
m <- idmModel(scale.lifetime=1/10,scale.illtime=1/8)
distribution(m,"X") <- binomial.lvm()
regression(m,latent.lifetime~X) <- 0.7
set.seed(30)
d <- sim(m,100)
fit.weib <- idm(formula02=Hist(observed.lifetime,event=seen.exit)~1,
formula01=Hist(time=list(L,R),event=seen.ill)~1,data=d,conf.int=FALSE)
plot(fit.weib)

## Not run: 
##D ## FIXME: the limits for the 01 transition are a bit wide!?
##D ## with bootstrap confidence limits
##D fit.weib <- idm(formula02=Hist(observed.lifetime,event=seen.exit)~1,
##D formula01=Hist(time=list(L,R),event=seen.ill)~1,data=d,conf.int=TRUE)
##D plot(fit.weib)
## End(Not run)
 




