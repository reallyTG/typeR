library(rugarch)


### Name: HLTest
### Title: The Non-Parametric Density Test of Hong and Li
### Aliases: HLTest

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec(mean.model = list(armaOrder = c(1,1), include.mean = TRUE),
##D variance.model = list(model = "gjrGARCH"), distribution.model = "sstd")
##D fit = ugarchfit(spec, data = dji30ret[, 1, drop = FALSE])
##D z = residuals(fit)/sigma(fit)
##D PIT = pdist("sstd",z, mu = 0, sigma = 1, skew = coef(fit)["skew"], 
##D shape=coef(fit)["shape"])
##D print(HLTest(PIT, lags=4))
## End(Not run)


