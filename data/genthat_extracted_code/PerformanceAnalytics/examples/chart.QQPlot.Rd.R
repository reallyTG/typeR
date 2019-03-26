library(PerformanceAnalytics)


### Name: chart.QQPlot
### Title: Plot a QQ chart
### Aliases: chart.QQPlot

### ** Examples


library(MASS)
data(managers)

x = checkData(managers[,2, drop = FALSE], na.rm = TRUE, method = "vector")

#layout(rbind(c(1,2),c(3,4)))

# Panel 1, Normal distribution
chart.QQPlot(x, main = "Normal Distribution", distribution = 'norm', envelope=0.95)
# Panel 2, Log-Normal distribution
fit = fitdistr(1+x, 'lognormal')
chart.QQPlot(1+x, main = "Log-Normal Distribution", envelope=0.95, distribution='lnorm')
#other options could include
#, meanlog = fit$estimate[[1]], sdlog = fit$estimate[[2]])

## Not run: 
##D # Panel 3, Skew-T distribution
##D library(sn)
##D fit = st.mle(y=x)
##D chart.QQPlot(x, main = "Skew T Distribution", envelope=0.95, 
##D              distribution = 'st', location = fit$dp[[1]], 
##D              scale = fit$dp[[2]], shape = fit$dp[[3]], df=fit$dp[[4]])
##D 
##D #Panel 4: Stable Parietian
##D library(fBasics)
##D fit.stable = stableFit(x,doplot=FALSE)
##D chart.QQPlot(x, main = "Stable Paretian Distribution", envelope=0.95, 
##D              distribution = 'stable', alpha = fit(stable.fit)$estimate[[1]], 
##D              beta = fit(stable.fit)$estimate[[2]], gamma = fit(stable.fit)$estimate[[3]], 
##D              delta = fit(stable.fit)$estimate[[4]], pm = 0)
## End(Not run)
#end examples




