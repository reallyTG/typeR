library(JSM)


### Name: fitted
### Title: Extract Fitted Values for Joint Models
### Aliases: fitted.jmodelTM fitted.jmodelMult
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(proth ~ Trt * obstime, random = ~ 1 | ID, data = liver)
##D fitCOX <- coxph(Surv(start, stop, event) ~ Trt, data = liver, x = TRUE)
##D fitJT.ph <- jmodelTM(fitLME, fitCOX, liver, timeVarY = 'obstime')
##D 
##D # fitted values for the longitudinal process
##D fitted(fitJT.ph, type = "Conditional")
## End(Not run)



