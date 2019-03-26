library(JMbayes)


### Name: plot
### Title: MCMC Diagnostics for Joint Models
### Aliases: plot.JMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * year, random = ~ 1 | id, data = pbc2)
##D 
##D # survival regression fit
##D fitSURV <- coxph(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D 
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModelBayes(fitLME, fitSURV, timeVar = "year")
##D 
##D plot(fitJOINT)
## End(Not run)



