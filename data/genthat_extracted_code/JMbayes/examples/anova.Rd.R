library(JMbayes)


### Name: anova
### Title: Anova Method for Fitted Joint Models
### Aliases: anova.JMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D # composite event indicator
##D pbc2$status2 <- as.numeric(pbc2$status != "alive")
##D pbc2.id$status2 <- as.numeric(pbc2.id$status != "alive")
##D 
##D # linear mixed model with natural cubic splines for the time
##D # effect
##D lmeFit.pbc1 <- lme(log(serBilir) ~ ns(year, 2), data = pbc2,
##D                    random = ~ ns(year, 2) | id, method = "ML")
##D 
##D # Cox regression model with baseline covariates
##D coxFit.pbc1 <- coxph(Surv(years, status2) ~ drug * age, data = pbc2.id, x = TRUE)
##D 
##D # the standard joint model fit with only the m_i(t) term in 
##D # the linear predictor of the survival submodel
##D jointFit.pbc1 <- jointModelBayes(lmeFit.pbc1, coxFit.pbc1, timeVar = "year")
##D 
##D # we include the time-dependent slopes term
##D dForm <- list(fixed = ~ 0 + dns(year, 2), random = ~ 0 + dns(year, 2), 
##D               indFixed = 2:3, indRandom = 2:3)
##D 
##D jointFit.pbc2 <- update(jointFit.pbc1, param = "td-both", extraForm = dForm)
##D 
##D # we include the cumulative effect of the marker
##D iForm <- list(fixed = ~ 0 + year + ins(year, 2), random = ~ 0 + year + ins(year, 2), 
##D               indFixed = 1:3, indRandom = 1:3)
##D 
##D jointFit.pbc3 <- update(jointFit.pbc1, param = "td-extra", extraForm = iForm)
##D 
##D 
##D # we compare the three models
##D anova(jointFit.pbc1, jointFit.pbc2, jointFit.pbc3)
## End(Not run)



