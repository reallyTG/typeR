library(Countr)


### Name: renewal_methods
### Title: Methods for renewal objects
### Aliases: renewal_methods coef.renewal vcov.renewal residuals.renewal
###   residuals_plot.renewal fitted.renewal confint.renewal summary.renewal
###   print.renewal print.summary.renewal model.matrix.renewal
###   logLik.renewal nobs.renewal extractAIC.renewal
###   addBootSampleObject.renewal df.residual.renewal

### ** Examples

fn <- system.file("extdata", "McShane_Wei_results_boot.RDS", package = "Countr")
object <- readRDS(fn)
class(object) # "renewal"

coef(object)
vcov(object)

## Pearson residuals: rescaled by sd
head(residuals(object, "pearson"))
## response residuals: not rescaled
head(residuals(object, "response"))

head(fitted(object))

## loglik, nobs, AIC, BIC
c(loglik = as.numeric(logLik(object)), nobs = nobs(object),
  AIC = AIC(object), BIC = BIC(object))

asym <- se.coef(object, , "asymptotic")
boot <- se.coef(object, , "boot")
cbind(asym, boot)
## CI for coefficients
asym <- confint(object, type = "asymptotic")
## Commenting out for now, see the nite in the code of confint.renewal():
## boot <- confint(object, type = "boot", bootType = "norm")
## list(asym = asym, boot = boot)
summary(object)
print(object)
## see renewal_methods
## see renewal_methods



