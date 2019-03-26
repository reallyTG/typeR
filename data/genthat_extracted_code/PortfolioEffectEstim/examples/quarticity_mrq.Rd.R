library(PortfolioEffectEstim)


### Name: quarticity_mrq
### Title: Modulated Realized Quarticity
### Aliases: quarticity_mrq
### Keywords: PortfolioEffectEstim,nonparametric, models quarticity_mrq

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(quarticity_mrq(estimator),title="MRQ")
## End(Not run)


