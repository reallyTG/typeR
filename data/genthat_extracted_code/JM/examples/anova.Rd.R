library(JM)


### Name: anova
### Title: Anova Method for Fitted Joint Models
### Aliases: anova.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit without treatment effect
##D fitLME.null <- lme(sqrt(CD4) ~ obstime, 
##D     random = ~ 1 | patient, data = aids)
##D # cox model fit without treatment effect
##D fitCOX.null <- coxph(Surv(Time, death) ~ 1, 
##D     data = aids.id, x = TRUE)
##D # joint model fit without treatment effect
##D fitJOINT.null <- jointModel(fitLME.null, fitCOX.null, 
##D     timeVar = "obstime", method = "weibull-PH-aGH")
##D 
##D # linear mixed model fit with treatment effect
##D fitLME.alt <- lme(sqrt(CD4) ~ obstime * drug - drug, 
##D     random = ~ 1 | patient, data = aids)
##D # cox model fit with treatment effect
##D fitCOX.alt <- coxph(Surv(Time, death) ~ drug, 
##D     data = aids.id, x = TRUE)
##D # joint model fit with treatment effect
##D fitJOINT.alt <- jointModel(fitLME.alt, fitCOX.alt, timeVar = "obstime", 
##D     method = "weibull-PH-aGH")
##D 
##D # likelihood ratio test for treatment effect
##D anova(fitJOINT.null, fitJOINT.alt)
## End(Not run)



