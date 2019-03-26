library(PortfolioEffectHFT)


### Name: upside_variance
### Title: Upside Variance
### Aliases: upside_variance upside_variance,portfolio-method
###   upside_variance,position-method
### Keywords: PortfolioEffectHFT upside_variance

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(upside_variance(positionC,0.05),upside_variance(positionGOOG,0.05),
##D upside_variance(positionAAPL,0.05)) 
##D plot(upside_variance(positionC,0.05),upside_variance(positionGOOG,0.05),
##D upside_variance(positionAAPL,0.05),legend=c('C','GOOG','AAPL'),title='Upside Variance')
## End(Not run)


