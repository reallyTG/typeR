library(JM)


### Name: rocJM
### Title: Predictive Accuracy Measures for Longitudinal Markers under a
###   Joint Modelling Framework
### Aliases: rocJM rocJM.jointModel
### Keywords: methods

### ** Examples

## Not run: 
##D fitLME <- lme(sqrt(CD4) ~ obstime * (drug + AZT + prevOI + gender), 
##D     random = ~ obstime | patient, data = aids)
##D fitSURV <- coxph(Surv(Time, death) ~ drug + AZT + prevOI + gender, 
##D     data = aids.id, x = TRUE)
##D fit.aids <- jointModel(fitLME, fitSURV, timeVar = "obstime", 
##D     method = "piecewise-PH-aGH")
##D 
##D # the following will take some time to execute...
##D ND <- aids[aids$patient == "7", ]
##D roc <- rocJM(fit.aids, dt = c(2, 4, 8), ND, idVar = "patient")
##D roc
## End(Not run)



