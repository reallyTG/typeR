library(PortfolioEffectEstim)


### Name: variance_msrv
### Title: Multiple Scales Realized Variance
### Aliases: variance_msrv variance_msrvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_msrv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_msrv(estimator),title='MSRV',legend='Simple')+
##D util_line2d(variance_msrvRolling(estimator,wLength=3600),legend='Rolling Window')
## End(Not run)


