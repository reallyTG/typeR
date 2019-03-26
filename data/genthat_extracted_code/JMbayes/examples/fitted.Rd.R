library(JMbayes)


### Name: fitted & residuals
### Title: Fitted Values and Residuals for Joint Models
### Aliases: fitted.JMbayes residuals.JMbayes
### Keywords: methods

### ** Examples

## Not run: 
##D lmeFit <- lme(log(serBilir) ~ ns(year, 2), data = pbc2,
##D               random = ~ ns(year, 2) | id)
##D survFit <- coxph(Surv(years, status2) ~ 1, data = pbc2.id, x = TRUE)
##D jointFit <- jointModelBayes(lmeFit, survFit, timeVar = "year")
##D 
##D fitted(jointFit, process = "Event")
##D residuals(jointFit, type = "Subject", standardized = TRUE)
## End(Not run)



