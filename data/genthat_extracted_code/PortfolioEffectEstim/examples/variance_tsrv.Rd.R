library(PortfolioEffectEstim)


### Name: variance_tsrv
### Title: Two Scales Realized Variance
### Aliases: variance_tsrv variance_tsrvRolling
### Keywords: PortfolioEffectEstim,nonparametric, models variance_tsrv

### ** Examples
 
## Not run: 
##D data(spy.data) 
##D estimator=estimator_create(priceData=spy.data)
##D estimator_settings(estimator,
##D 				   inputSamplingInterval = '10s',
##D 				   resultsSamplingInterval = '10s')
##D util_plot2d(variance_tsrv(estimator),title='TSRV',legend='Simple')+
##D util_line2d(variance_tsrvRolling(estimator,wLength=3600),legend='Rolling Window')
## End(Not run)


