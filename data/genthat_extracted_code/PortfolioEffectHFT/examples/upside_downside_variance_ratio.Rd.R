library(PortfolioEffectHFT)


### Name: upside_downside_variance_ratio
### Title: Upside/Downside Variance Ratio
### Aliases: upside_downside_variance_ratio
###   upside_downside_variance_ratio,portfolio-method
###   upside_downside_variance_ratio,position-method
### Keywords: PortfolioEffectHFT upside_downside_variance_ratio

### ** Examples

## Not run: 
##D dateStart = "2014-11-17 09:30:00"
##D dateEnd = "2014-11-17 16:00:00"
##D portfolio=portfolio_create(dateStart,dateEnd)
##D positionAAPL=position_add(portfolio,'AAPL',100)
##D positionC=position_add(portfolio,'C',300) 
##D positionGOOG=position_add(portfolio,'GOOG',150) 
##D result=compute(upside_downside_variance_ratio(positionC,0.05),
##D upside_downside_variance_ratio(positionGOOG,0.05),
##D upside_downside_variance_ratio(positionAAPL,0.05)) 
##D plot(upside_downside_variance_ratio(positionC,0.05),
##D upside_downside_variance_ratio(positionGOOG,0.05),
##D upside_downside_variance_ratio(positionAAPL,0.05),
##D legend=c('C','GOOG','AAPL'),title='Upside/Downside Variance Ratio')
## End(Not run)


