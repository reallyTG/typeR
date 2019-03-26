library(rugarch)


### Name: uGARCHfit-class
### Title: class: Univariate GARCH Fit Class
### Aliases: uGARCHfit-class residuals,uGARCHfit-method
###   fitted,uGARCHfit-method vcov,uGARCHfit-method coef,uGARCHfit-method
###   confint,uGARCHfit-method infocriteria,uGARCHfit-method
###   infocriteria,ANY-method infocriteria nyblom,uGARCHfit-method
###   nyblom,ANY-method nyblom getspec,uGARCHfit-method getspec,ANY-method
###   getspec signbias,uGARCHfit-method signbias,ANY-method
###   signbias-methods signbias sigma,uGARCHfit-method sigma,ANY-method
###   sigma gof,ANY,ANY-method gof,uGARCHfit,numeric-method gof
###   quantile,uGARCHfit-method pit,uGARCHfit-method pit,ANY-method pit
###   likelihood,uGARCHfit-method likelihood,ANY-method likelihood
###   newsimpact,ANY-method newsimpact,uGARCHfit-method newsimpact
###   halflife,ANY,ANY,ANY,ANY,ANY-method
###   halflife,missing,numeric,character,character,ANY-method
###   halflife,uGARCHfit,missing,missing,missing,missing-method halflife
###   persistence,ANY,ANY,ANY,ANY,ANY-method
###   persistence,missing,numeric,character,character,ANY-method
###   persistence,uGARCHfit,missing,missing,missing,missing-method
###   persistence uncvariance,ANY,ANY,ANY,ANY,ANY,ANY-method
###   uncvariance,missing,numeric,character,character,ANY,ANY-method
###   uncvariance,uGARCHfit,missing,missing,missing,missing,missing-method
###   uncvariance uncmean,uGARCHfit-method uncmean,ANY-method uncmean
###   convergence,uGARCHfit-method convergence,ANY-method convergence
###   reduce,uGARCHfit-method reduce,ANY-method reduce
###   plot,uGARCHfit,missing-method show,uGARCHfit-method
### Keywords: classes

### ** Examples

## Not run: 
##D # Basic GARCH(1,1) Spec
##D data(dmbp)
##D spec = ugarchspec()
##D fit = ugarchfit(data = dmbp[,1], spec = spec)
##D fit
##D # object fit:
##D slotNames(fit)
##D # sublist fit@fit
##D names(fit@fit)
##D coef(fit)
##D infocriteria(fit)
##D likelihood(fit)
##D nyblom(fit)
##D signbias(fit)
##D head(sigma(fit))
##D head(residuals(fit))
##D head(fitted(fit))
##D gof(fit,c(20,30,40,50))
##D uncmean(fit)
##D uncvariance(fit)
##D #plot(fit,which="all")
##D # news impact example
##D spec = ugarchspec(variance.model=list(model="apARCH"))
##D fit = ugarchfit(data = dmbp[,1], spec = spec)
##D # note that newsimpact does not require the residuals (z) as it
##D # will discover the relevant range to plot against by using the min/max
##D # of the fitted residuals.
##D ni=newsimpact(z = NULL, fit)
##D #plot(ni$zx, ni$zy, ylab=ni$yexpr, xlab=ni$xexpr, type="l", main = "News Impact Curve")
## End(Not run)


