library(JSM)


### Name: residuals
### Title: Extract Residuals for Joint Models
### Aliases: residuals.jmodelTM residuals.jmodelMult
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(proth ~ Trt * obstime, random = ~ 1 | ID, data = liver)
##D fitCOX <- coxph(Surv(start, stop, event) ~ Trt, data = liver, x = TRUE)
##D fitJT.ph <- jmodelTM(fitLME, fitCOX, liver, timeVarY = 'obstime')
##D 
##D # residuals for the longitudinal process
##D residuals(fitJT.ph, type = "Standardized-Conditional")
## End(Not run)



