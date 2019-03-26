library(JSM)


### Name: jmodelTM
### Title: Semiparametric Joint Models for Survival and Longitudinal Data
### Aliases: jmodelTM
### Keywords: survival models

### ** Examples

# linear mixed-effects model fit with random intercept
fitLME <- lme(sqrt(CD4) ~ obstime + I(obstime ^ 2) + drug : obstime + drug : I(obstime ^ 2), 
              random = ~ 1 | ID, data = aids)
# Cox proportional hazards model fit with a single time-independent covariate
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = aids, x = TRUE)

# joint model fit which assumes the Cox proportional hazards model for the survival process
# Use 'max.iter = 5', 'nknot = 3' and the 'PFDS' method to calculate standard 
# error estimates as a quick toy example 
fitJT.ph <- jmodelTM(fitLME, fitCOX, aids, timeVarY = 'obstime', 
                     control = list(SE.method = 'PFDS', max.iter = 5, nknot = 3))
summary(fitJT.ph)

## Not run: 
##D # joint model fit with the default control
##D fitJT.ph2 <- jmodelTM(fitLME, fitCOX, aids, timeVarY = 'obstime')
##D summary(fitJT.ph2)
##D # joint model fit where the survival and longitudinal processes only share 
##D # the same random effect
##D fitJT.ph3 <- jmodelTM(fitLME, fitCOX, aids, model = 2, timeVarY = 'obstime')
##D summary(fitJT.ph3)
##D 
##D # joint model fit which assumes the proportional odds model for the survival process
##D fitJT.po <- jmodelTM(fitLME, fitCOX, aids, rho = 1, timeVarY = 'obstime')
##D summary(fitJT.po)
##D # joint model fit where the survival and longitudinal processes only share 
##D # the same random effect
##D fitJT.po2 <- jmodelTM(fitLME, fitCOX, aids, model = 2, rho = 1, timeVarY = 'obstime')
##D summary(fitJT.po2)
##D 
##D # linear mixed-effects model fit with random intercept and random slope
##D fitLME2 <- lme(sqrt(CD4) ~ drug + obstime + I(obstime ^ 2) + drug : obstime + 
##D                drug : I(obstime ^2), random = ~ obstime | ID, data = aids)
##D # Cox proportional hazards model fit with a time-dependent covariate
##D fitCOX2 <- coxph(Surv(start, stop, event) ~ drug + as.numeric(drug) : obstime, 
##D                  data = aids, x = TRUE)
##D # joint model fit in which \code{timeVarT} must be specified
##D fitJT.ph4 <- jmodelTM(fitLME2, fitCOX2, aids, timeVarY = 'obstime', timeVarT = 'obstime')
##D summary(fitJT.ph4)
## End(Not run)



