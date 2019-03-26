library(JM)


### Name: plot
### Title: Plot Diagnostics for Joint Models
### Aliases: plot.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * year, random = ~ 1 | id, data = pbc2)
##D # survival regression fit
##D fitSURV <- survreg(Surv(years, status2) ~ drug, data = pbc2.id, x = TRUE)
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year")
##D 
##D plot(fitJOINT, 3, add.KM = TRUE, col = "red", lwd = 2)
##D 
##D par(mfrow = c(2, 2))
##D plot(fitJOINT)
## End(Not run)



