library(PortfolioEffectEstim)


### Name: quarticity_rq
### Title: Realized Quarticity
### Aliases: quarticity_rq
### Keywords: PortfolioEffectEstim,nonparametric, models quarticity_rq

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(quarticity_rq(estimator),title="RQ")
## End(Not run)


