library(JSM)


### Name: ranef
### Title: Extract Random Effects for Joint Models
### Aliases: ranef.jmodelTM ranef.jmodelMult
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(proth ~ Trt * obstime, random = ~ 1 | ID, data = liver)
##D fitCOX <- coxph(Surv(start, stop, event) ~ Trt, data = liver, x = TRUE)
##D fitJT.ph <- jmodelTM(fitLME, fitCOX, liver, timeVarY = 'obstime')
##D 
##D # random effect for the joint model
##D ranef(fitJT.ph)
## End(Not run)



