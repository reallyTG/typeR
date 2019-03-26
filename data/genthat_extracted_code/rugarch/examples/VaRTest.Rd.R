library(rugarch)


### Name: VaRTest
### Title: Value at Risk Exceedances Test
### Aliases: VaRTest

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec(mean.model = list(armaOrder = c(1,1), include.mean = TRUE),
##D variance.model = list(model = "gjrGARCH"), distribution.model = "sstd")
##D fit = ugarchfit(spec, data = dji30ret[1:1000, 1, drop = FALSE])
##D spec2 = spec
##D setfixed(spec2)<-as.list(coef(fit))
##D filt = ugarchfilter(spec2, dji30ret[1001:2500, 1, drop = FALSE], n.old = 1000)
##D actual = dji30ret[1001:2500,1]
##D # location+scale invariance allows to use [mu + sigma*q(p,0,1,skew,shape)]
##D VaR = fitted(filt) + sigma(filt)*qdist("sstd", p=0.05, mu = 0, sigma = 1, 
##D skew  = coef(fit)["skew"], shape=coef(fit)["shape"])
##D print(VaRTest(0.05, as.numeric(actual), as.numeric(VaR)))
## End(Not run)


