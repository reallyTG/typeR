library(FlowScreen)


### Name: FlowScreen
### Title: Screen Daily Discharge Time Series for Temporal Trends and
###   Change Points
### Aliases: FlowScreen FlowScreen
### Keywords: package

### ** Examples

## Not run: 
##D # load daily streamflow time series for the Caniapiscau River
##D data(caniapiscau)
##D 
##D # summary plot of the annual flow regime
##D caniapiscau.ts <- create.ts(caniapiscau)
##D regime(caniapiscau.ts)
##D 
##D # calculate high flow, low flow, and baseflow metrics
##D res <- metrics.all(caniapiscau.ts)
##D 
##D # plot histogram of changepoints for high flow, low flow, and baseflow metrics
##D screen.cpts(res, type="h")
##D screen.cpts(res, type="l")
##D screen.cpts(res, type="b")
##D 
##D # or plot all changepoints together
##D cpts <- screen.cpts(res)
##D 
##D # create screening plots for high, low, and baseflow metrics
##D screen.summary(res, type="h")
##D screen.summary(res, type="l")
##D screen.summary(res, type="b")
## End(Not run)




