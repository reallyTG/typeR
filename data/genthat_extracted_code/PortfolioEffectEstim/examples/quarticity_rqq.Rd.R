library(PortfolioEffectEstim)


### Name: quarticity_rqq
### Title: Realized Quadpower Quarticity
### Aliases: quarticity_rqq
### Keywords: PortfolioEffectEstim,nonparametric, models quarticity_rqq

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(quarticity_rqq(estimator),title="RQQ")
## End(Not run)


