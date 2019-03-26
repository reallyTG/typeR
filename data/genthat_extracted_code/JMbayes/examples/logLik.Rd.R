library(JMbayes)


### Name: logLik.JMbayes
### Title: Log-Likelihood for Joint Models
### Aliases: logLik.JMbayes
### Keywords: regression

### ** Examples

## Not run: 
##D lmeFit <- lme(log(serBilir) ~ ns(year, 2), data = pbc2, 
##D     random = ~ ns(year, 2) | id)
##D survFit <- coxph(Surv(years, status2) ~ 1, data = pbc2.id, x = TRUE)
##D 
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D 
##D logLik(jointFit)
##D logLik(jointFit, priors = FALSE)
##D logLik(jointFit, marginal.b = FALSE)
## End(Not run)



