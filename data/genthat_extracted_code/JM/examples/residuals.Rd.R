library(JM)


### Name: residuals
### Title: Residuals for Joint Models
### Aliases: residuals.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(sqrt(CD4) ~ obstime * drug - drug, 
##D     random = ~ 1 | patient, data = aids)
##D # cox model fit
##D fitCOX <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
##D 
##D # joint model fit, under the additive log cumulative hazard model
##D fitJOINT <- jointModel(fitLME, fitCOX, 
##D     timeVar = "obstime")
##D 
##D # residuals for the longitudinal outcome
##D head(cbind(
##D     "Marginal" = residuals(fitJOINT),
##D     "std-Marginal" = residuals(fitJOINT, type = "stand-Marginal"),
##D     "Subject" = residuals(fitJOINT, type = "Subject"),
##D     "std-Subject" = residuals(fitJOINT, type = "stand-Subject")
##D ))
##D 
##D # residuals for the survival outcome
##D head(cbind(
##D     "Martingale" = residuals(fitJOINT, process = "Event", type = "Martingale"),
##D     "CoxSnell" = residuals(fitJOINT, process = "Event", type = "CoxSnell")
##D ))
## End(Not run)



