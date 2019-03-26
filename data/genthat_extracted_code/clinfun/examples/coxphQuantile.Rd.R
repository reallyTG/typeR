library(clinfun)


### Name: coxphQuantile
### Title: Survival time quantile as a function of covariate
### Aliases: coxphQuantile
### Keywords: survival

### ** Examples

## Not run: 
##D   library(survival)
##D data(pbc)
##D pbcfit <- coxph(Surv(time, status==2) ~ trt + log(copper), pbc,
##D                       subset=(trt>0 & copper>0)) 
##D plot(log(pbc$copper[pbc$trt>0 & pbc$copper>0]), pbc$time[pbc$trt>0 &
##D   pbc$copper>0], pch=c("o","x")[1+pbc$status[pbc$trt>0 & pbc$copper>0]], 
##D   xlab="log Copper", ylab="Survival time")
##D coxphQuantile(pbcfit, c(2.5,6), whichx=2, otherx=1)
##D coxphQuantile(pbcfit, c(2.5,6), p=0.75, whichx=2, otherx=2, col=2)
## End(Not run)



