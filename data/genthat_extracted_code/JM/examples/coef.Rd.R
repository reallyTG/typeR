library(JM)


### Name: coef
### Title: Estimated Coefficients for Joint Models
### Aliases: coef.jointModel fixef.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(sqrt(CD4) ~ obstime * drug - drug, 
##D     random = ~ 1 | patient, data = aids)
##D # cox model fit
##D fitCOX <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
##D 
##D # joint model fit
##D fitJOINT <- jointModel(fitLME, fitCOX, 
##D     timeVar = "obstime")
##D 
##D # fixed effects for the longitudinal process
##D fixef(fitJOINT)
##D 
##D # fixed effects + random effects estimates for the longitudinal 
##D # process
##D coef(fitJOINT)
##D 
##D # fixed effects for the event process
##D fixef(fitJOINT, process = "Event")
##D coef(fitJOINT, process = "Event")
## End(Not run)



