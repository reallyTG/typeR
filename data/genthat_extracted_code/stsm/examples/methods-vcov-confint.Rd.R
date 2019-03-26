library(stsm)


### Name: methods-vcov-confint
### Title: Variance-covariance Matrix for a Fitted 'stsm' Model Object
### Aliases: methods-vcov-confint vcov.stsmFit vcov.stsm confint.stsmFit
### Keywords: ts

### ** Examples

## Not run: 
##D data("llmseas")
##D # fit the local level plus seasonal model with default arguments
##D # using the Newton-Raphson algorithm
##D m <- stsm.model(model = "llm+seas", y = llmseas)
##D res <- maxlik.fd.scoring(m = m, information = "observed")
##D coef(res)
##D # confidence intervals for parameter estimates ...
##D # ... based on the covariance matrix of parameter estimates
##D # gives a warning since the lower limit of the confidence interval
##D # for parameter 'var2' was forced to be non-negative (fixed to 0)
##D civcov <- confint(res, type = "vcov", vcov.type = "hessian")
##D civcov
##D # ... based on bootstrapping the periodogram
##D # NOTE: this will take a while to run
##D set.seed(643)
##D ciboot <- confint(res, type = "bootstrap", breps = 100)
##D ciboot
## End(Not run)



