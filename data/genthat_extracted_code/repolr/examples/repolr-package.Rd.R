library(repolr)


### Name: repolr-package
### Title: Repeated Measures Proportional Odds Logistic Regression using
###   GEE
### Aliases: repolr-package repolr print.repolr coef.repolr fitted.repolr
###   model.matrix.repolr terms.repolr residuals.repolr smat cmat alphpow
###   hgmat ordgee upalpha icormat potest
### Keywords: models

### ** Examples


data(HHSpain)
mod.0 <- repolr(HHSpain~Sex*Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="uniform", alpha=0.5)
summary(mod.0)
summary(update(mod.0, diffmeth = "numeric"))
summary(update(mod.0, fixed = TRUE, alpha =0.5))




