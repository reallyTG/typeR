library(rugarch)


### Name: BerkowitzTest
### Title: Berkowitz Density Forecast Likelihood Ratio Test
### Aliases: BerkowitzTest

### ** Examples

## Not run: 
##D #  A univariate GARCH model is used with rolling out of sample forecasts.
##D data(dji30ret)
##D spec = ugarchspec(mean.model = list(armaOrder = c(6,1), include.mean = TRUE),
##D variance.model = list(model = "gjrGARCH"), distribution.model = "nig")
##D fit = ugarchfit(spec, data = dji30ret[, 1, drop = FALSE], out.sample = 1000)
##D pred = ugarchforecast(fit, n.ahead = 1, n.roll = 999)
##D dmatrix = cbind(as.numeric(fitted(pred)),as.numeric(sigma(pred)), 
##D rep(coef(fit)["skew"],1000), rep(coef(fit)["shape"],1000))
##D colnames(dmatrix) = c("mu", "sigma", "skew", "shape")
##D # Get Realized (Oberved) Data
##D obsx = tail(dji30ret[,1], 1000)
##D # Transform to Uniform
##D uvector = apply(cbind(obsx,dmatrix), 1, FUN = function(x) pdist("nig", q = x[1],
##D mu = x[2], sigma = x[3], skew = x[4], shape = x[5]))
##D 
##D # hist(uvector)
##D # transform to N(0,1)
##D nvector = qnorm(uvector)
##D test1 = BerkowitzTest(data = nvector, lags = 1, significance = 0.05)
##D test2 = BerkowitzTest(data = nvector, alpha = 0.05, significance = 0.05, 
##D tail.test=TRUE)
##D test3 = BerkowitzTest(data = nvector, alpha = 0.01, significance = 0.05, 
##D tail.test=TRUE)
## End(Not run)



