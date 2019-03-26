library(JM)


### Name: fitted
### Title: Fitted Values for Joint Models
### Aliases: fitted.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D # linear mixed model fit
##D fitLME <- lme(log(serBilir) ~ drug * year, 
##D     random = ~ 1 | id, data = pbc2)
##D # survival regression fit
##D fitSURV <- survreg(Surv(years, status2) ~ drug, 
##D     data = pbc2.id, x = TRUE)
##D # joint model fit, under the (default) Weibull model
##D fitJOINT <- jointModel(fitLME, fitSURV, timeVar = "year")
##D 
##D # fitted for the longitudinal process
##D head(cbind(
##D     "Marg" = fitted(fitJOINT), 
##D     "Subj" = fitted(fitJOINT, type = "Subject")
##D ))
##D 
##D # fitted for the event process - survival function
##D head(cbind(
##D     "Marg" = fitted(fitJOINT, process = "Ev"), 
##D     "Subj" = fitted(fitJOINT, process = "Ev", type = "Subject")
##D ))
##D 
##D # fitted for the event process - cumulative hazard function
##D head(cbind(
##D     "Marg" = fitted(fitJOINT, process = "Ev", 
##D         scale = "cumulative-Hazard"), 
##D     "Subj" = fitted(fitJOINT, process = "Ev", type = "Subject", 
##D         scale = "cumulative-Hazard")
##D ))
## End(Not run)



