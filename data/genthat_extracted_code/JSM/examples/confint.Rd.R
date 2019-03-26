library(JSM)


### Name: confint
### Title: Obtain Confidence Intervals for Joint Model Parameters
### Aliases: confint.jmodelTM confint.jmodelMult
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(proth ~ Trt * obstime, random = ~ 1 | ID, data = liver)
##D fitCOX <- coxph(Surv(start, stop, event) ~ Trt, data = liver, x = TRUE)
##D fitJT.ph <- jmodelTM(fitLME, fitCOX, liver, timeVarY = 'obstime')
##D 
##D # 95% confidence intervals for the joint model parameters
##D confint(fitJT.ph)
## End(Not run)



