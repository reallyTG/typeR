library(ggfortify)


### Name: autoplot.ts
### Title: Autoplot time-series-like
### Aliases: autoplot.ts autoplot.xts autoplot.timeSeries autoplot.irts
###   autoplot.stl autoplot.decomposed.ts

### ** Examples

## Not run: 
##D data(Canada, package = 'vars')
##D autoplot(AirPassengers)
##D autoplot(UKgas, ts.geom = 'bar')
##D autoplot(Canada)
##D autoplot(Canada, facets = FALSE)
##D 
##D library(zoo)
##D autoplot(xts::as.xts(AirPassengers))
##D autoplot(timeSeries::as.timeSeries(AirPassengers))
##D its <- tseries::irts(cumsum(rexp(10, rate = 0.1)), matrix(rnorm(20), ncol=2))
##D autoplot(its)
##D 
##D autoplot(stats::stl(UKgas, s.window = 'periodic'))
##D autoplot(stats::decompose(UKgas))
## End(Not run)



