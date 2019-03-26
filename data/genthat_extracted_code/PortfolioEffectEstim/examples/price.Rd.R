library(PortfolioEffectEstim)


### Name: price
### Title: Get Asset Price
### Aliases: price
### Keywords: PortfolioEffectEstim,nonparametric, models price

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D estimator=estimator_create('AAPL',dateStart,dateEnd)
##D estimator_settings(estimator,resultsSamplingInterval='60s')
##D AAPL=price(estimator)
##D util_plot2d(AAPL,title='AAPL')
## End(Not run)


