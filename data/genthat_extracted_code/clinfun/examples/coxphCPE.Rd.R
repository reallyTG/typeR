library(clinfun)


### Name: coxphCPE
### Title: Gonen & Heller Concordance Probability Estimate
### Aliases: coxphCPE
### Keywords: survival

### ** Examples

## Not run: 
##D  library(survival)
##D   data(pbc)
##D   pbcfit <- coxph(Surv(time, status==2) ~ trt + log(copper), pbc,
##D     subset=(trt>0 & copper>0))
##D   coxphCPE(pbcfit)
## End(Not run)


