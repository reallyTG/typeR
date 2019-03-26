library(JM)


### Name: plot.rocJM
### Title: Plot Method for rocJM Objects
### Aliases: plot.rocJM
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(sqrt(CD4) ~ obstime + obstime:(drug + AZT + prevOI + gender), 
##D     random = ~ obstime | patient, data = aids)
##D fitSURV <- coxph(Surv(Time, death) ~ drug + AZT + prevOI + gender, 
##D     data = aids.id, x = TRUE)
##D fit.aids <- jointModel(fitLME, fitSURV, timeVar = "obstime", 
##D     method = "piecewise-PH-aGH")
##D 
##D ND <- aids[aids$patient == "7", ]
##D roc <- rocJM(fit.aids, dt = c(2, 4, 8), ND, idVar = "patient")
##D plot(roc, lwd = 2, legend = TRUE)
##D plot(roc, type = "AUC")
## End(Not run)



