library(JSM)


### Name: jmodelMult
### Title: Semiparametric Joint Models for Survival and Longitudinal Data
###   with Nonparametric Multiplicative Random Effects
### Aliases: jmodelMult
### Keywords: survival models

### ** Examples

# linear mixed-effects model fit where the fixed effect is modeled by 
# quadratic B-splie basis with no internal knots
fitLME <- lme(log(serBilir) ~ bs(obstime, degree = 2, Boundary.knots = c(0, 15)), 
              random = ~ 1 | ID, data = pbc)
# Cox proportional hazards model fit with a single time-independent covariate
fitCOX <- coxph(Surv(start, stop, event) ~ drug, data = pbc, x = TRUE)

# joint model fit which assumes the Cox proportional hazards model for the survival process 
# and NMRE for the longitudinal process. Use 'max.iter = 25', 'nknot = 3' and 
# the 'PFDS' method to calculate standard error estimates as a quick toy example 
fitJTMult.ph <- jmodelMult(fitLME, fitCOX, pbc, timeVarY = "obstime", 
                           control = list(SE.method = 'PFDS', max.iter = 25, nknot = 3))
summary(fitJTMult.ph)

## Not run: 
##D # joint model fit with the default control
##D fitJTMult.ph2 <- jmodelMult(fitLME, fitCOX, pbc, timeVarY = "obstime")
##D summary(fitJTMult.ph2)
##D # joint model fit where the survival and longitudinal processes only share 
##D # the same random effect
##D fitJTMult.ph3 <- jmodelMult(fitLME, fitCOX, pbc, model = 2, timeVarY = "obstime")
##D summary(fitJTMult.ph3)
##D 
##D # joint model fit which assumes the proportional odds model for the survival process 
##D # and NMRE model for the longitudinal process
##D fitJTMult.po <- jmodelMult(fitLME, fitCOX, pbc, rho = 1, timeVarY = "obstime")
##D summary(fitJTMult.po)
##D # joint model fit where the survival and longitudinal processes only share 
##D # the same random effect
##D fitJTMult.po2 <- jmodelMult(fitLME, fitCOX, pbc, model = 2, rho = 1, timeVarY = "obstime")
##D summary(fitJTMult.po2)
##D 
##D # allow baseline covariates in the NMRE model for the longitudinal process
##D fitLME2 <- lme(log(serBilir) ~ drug + bs(obstime, degree = 2, Boundary.knots = c(0, 15)), 
##D                random = ~1 | ID, data = pbc)
##D fitJTMult.ph4 <- jmodelMult(fitLME2, fitCOX, pbc, timeVarY = "obstime")
##D summary(fitJTMult.ph4)
##D 
##D # Cox proportional hazards model fit with a time-dependent covariate
##D fitCOX2 <- coxph(Surv(start, stop, event) ~ drug + as.numeric(drug) : obstime, 
##D                  data = pbc, x = TRUE)
##D # joint model fit in which \code{timeVarT} must be specified
##D fitJTMult.ph5 <- jmodelMult(fitLME, fitCOX2, pbc, timeVarY = "obstime", timeVarT = 'obstime', 
##D                             control = list(max.iter = 300))
##D summary(fitJTMult.ph5)
## End(Not run)



