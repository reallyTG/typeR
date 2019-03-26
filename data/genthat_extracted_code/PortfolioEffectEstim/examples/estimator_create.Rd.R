library(PortfolioEffectEstim)


### Name: estimator_create
### Title: Creates new estimator
### Aliases: estimator_create
### Keywords: PortfolioEffectEstim,nonparametric, models estimator_create

### ** Examples

## Not run: 
##D data(goog.data) 
##D estimator=estimator_create(priceData=goog.data)
##D estimator_settings(estimator,resultsSamplingInterval='60s')
##D util_plot2d(variance_rv(estimator),title="RV")
##D 
##D 
##D estimator=estimator_create(asset='AAPL',fromTime="2014-09-01 09:00:00", 
##D toTime="2014-09-14 16:00:00")
##D estimator_settings(estimator,resultsSamplingInterval='60s')
##D util_plot2d(variance_tsrv(estimator,K=2),title="TSRV")
##D 
##D estimator=estimator_create(asset='GOOG',fromTime="t-2", toTime="t")
##D estimator_settings(estimator,resultsSamplingInterval='60s')
##D util_plot2d(variance_mrv(estimator),title="MRV")
## End(Not run)


