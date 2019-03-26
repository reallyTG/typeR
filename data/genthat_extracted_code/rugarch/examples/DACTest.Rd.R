library(rugarch)


### Name: DACTest
### Title: Directional Accuracy Test
### Aliases: DACTest

### ** Examples

## Not run: 
##D data(dji30ret)
##D spec = ugarchspec(mean.model = list(armaOrder = c(6,1), include.mean = TRUE),
##D variance.model = list(model = "gjrGARCH"), distribution.model = "nig")
##D fit = ugarchfit(spec, data = dji30ret[, 1, drop = FALSE], out.sample = 1000)
##D pred = ugarchforecast(fit, n.ahead = 1, n.roll = 999)
##D # Get Realized (Oberved) Data
##D obsx = tail(dji30ret[,1], 1000)
##D forc = as.numeric(as.data.frame(pred,rollframe="all",align=FALSE,which="series"))
##D print(DACTest(forc, obsx, test = "PT", conf.level = 0.95))
##D print(DACTest(forc, obsx, test = "AG", conf.level = 0.95))
## End(Not run)


