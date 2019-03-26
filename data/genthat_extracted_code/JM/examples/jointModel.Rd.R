library(JM)


### Name: jointModel
### Title: Joint Models for Longitudinal and Survival Data
### Aliases: jointModel
### Keywords: multivariate regression

### ** Examples

## Not run: 
##D # linear mixed model fit (random intercepts)
##D fitLME <- lme(log(serBilir) ~ drug * year, random = ~ 1 | id, data = pbc2)
##D # survival regression fit
##D fitSURV <- survreg(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year")
##D fitJOINT
##D summary(fitJOINT)
##D 
##D # linear mixed model fit (random intercepts + random slopes)
##D fitLME <- lme(log(serBilir) ~ drug * year, random = ~ year | id, data = pbc2)
##D # survival regression fit
##D fitSURV <- survreg(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year")
##D fitJOINT
##D summary(fitJOINT)
##D 
##D # we also include an interaction term of log(serBilir) with drug
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year",
##D     interFact = list(value = ~ drug, data = pbc2.id))
##D fitJOINT
##D summary(fitJOINT)
##D 
##D 
##D # a joint model in which the risk for and event depends both on the true value of
##D # marker and the true value of the slope of the longitudinal trajectory
##D lmeFit <- lme(sqrt(CD4) ~ obstime * drug, random = ~ obstime | patient, data = aids)
##D coxFit <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
##D 
##D # to fit this model we need to specify the 'derivForm' argument, which is a list
##D # with first component the derivative of the fixed-effects formula of 'lmeFit' with
##D # respect to 'obstime', second component the indicator of which fixed-effects 
##D # coefficients correspond to the previous defined formula, third component the 
##D # derivative of the random-effects formula of 'lmeFit' with respect to 'obstime', 
##D # and fourth component the indicator of which random-effects correspond to the 
##D # previous defined formula
##D dForm <- list(fixed = ~ 1 + drug, indFixed = c(2, 4), random = ~ 1, indRandom = 2)
##D jointModel(lmeFit, coxFit, timeVar = "obstime", method = "spline-PH-aGH",
##D   parameterization = "both", derivForm = dForm)
##D 
##D 
##D # Competing Risks joint model
##D # we first expand the PBC dataset in the competing risks long format
##D # with two competing risks being death and transplantation
##D pbc2.idCR <- crLong(pbc2.id, "status", "alive")
##D 
##D # we fit the linear mixed model as before
##D lmeFit.pbc <- lme(log(serBilir) ~ drug * ns(year, 3), 
##D     random = list(id = pdDiag(form = ~ ns(year, 3))), data = pbc2)
##D 
##D # however, for the survival model we need to use the data in the long
##D # format, and include the competing risks indicator as a stratification
##D # factor. We also take interactions of the baseline covariates with the
##D # stratification factor in order to allow the effect of these covariates
##D # to be different for each competing risk
##D coxCRFit.pbc <- coxph(Surv(years, status2) ~ (drug + sex)*strata + strata(strata), 
##D     data = pbc2.idCR, x = TRUE)
##D 
##D # the corresponding joint model is fitted simply by including the above
##D # two submodels as main arguments, setting argument CompRisk to TRUE, 
##D # and choosing as method = "spline-PH-aGH". Similarly as above, we also 
##D # include strata as an interaction factor to allow serum bilirubin to 
##D # have a different effect for each of the two competing risks
##D jmCRFit.pbc <- jointModel(lmeFit.pbc, coxCRFit.pbc, timeVar = "year", 
##D     method = "spline-PH-aGH", 
##D     interFact = list(value = ~ strata, data = pbc2.idCR), 
##D     CompRisk = TRUE)
##D summary(jmCRFit.pbc)
##D 
##D # linear mixed model fit
##D fitLME <- lme(sqrt(CD4) ~ obstime * drug - drug, 
##D     random = ~ 1 | patient, data = aids)
##D # cox model fit
##D fitCOX <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)
##D # joint model fit with a spline-approximated baseline hazard function
##D fitJOINT <- jointModel(fitLME, fitCOX, 
##D     timeVar = "obstime", method = "spline-PH-aGH")
##D fitJOINT
##D summary(fitJOINT)
## End(Not run)



