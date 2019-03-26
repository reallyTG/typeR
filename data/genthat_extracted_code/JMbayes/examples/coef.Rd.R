library(JMbayes)


### Name: coef
### Title: Estimated Coefficients and Confidence Intervals for Joint Models
### Aliases: coef.JMbayes fixef.JMbayes confint.JMbayes
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
##D fitJOINT <- jointModelBayes(fitLME, fitCOX, 
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



