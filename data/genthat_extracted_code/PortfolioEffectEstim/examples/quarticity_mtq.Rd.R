library(PortfolioEffectEstim)


### Name: quarticity_mtq
### Title: Modulated Tripower Quarticity
### Aliases: quarticity_mtq
### Keywords: PortfolioEffectEstim,nonparametric, models quarticity_mtq

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(quarticity_mtq(estimator),title="MTQ")
## End(Not run)


