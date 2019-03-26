library(JM)


### Name: ranef
### Title: Random Effects Estimates for Joint Models
### Aliases: ranef.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * year, random = ~ 1 | id, data = pbc2)
##D # survival regression fit
##D fitSURV <- survreg(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D 
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year")
##D ranef(fitJOINT)
## End(Not run)



