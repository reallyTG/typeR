library(PortfolioEffectEstim)


### Name: quarticity_rtq
### Title: Realized Tripower Quarticity
### Aliases: quarticity_rtq
### Keywords: PortfolioEffectEstim,nonparametric, models quarticity_rtq

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(quarticity_rtq(estimator),title="RTQ")
## End(Not run)


