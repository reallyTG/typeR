library(rugarch)


### Name: GMMTest
### Title: The GMM Orthogonality Test of Hansen
### Aliases: GMMTest

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec(mean.model = list(armaOrder = c(1,1), include.mean = TRUE),
##D variance.model = list(model = "gjrGARCH"), distribution.model = "sstd")
##D fit = ugarchfit(spec, data = dji30ret[, 1, drop = FALSE])
##D z = residuals(fit)\/sigma(fit)
##D skew = dskewness("sstd",skew = coef(fit)["skew"], shape= coef(fit)["shape"])
##D # add back 3 since dkurtosis returns the excess kurtosis
##D kurt = 3+dkurtosis("sstd",skew = coef(fit)["skew"], shape= coef(fit)["shape"])
##D print(GMMTest(z, lags = 1, skew=skew, kurt=kurt))
## End(Not run)


