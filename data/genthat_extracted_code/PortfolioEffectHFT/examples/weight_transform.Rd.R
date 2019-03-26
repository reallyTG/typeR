library(PortfolioEffectHFT)


### Name: weight_transform
### Title: Weight Transform
### Aliases: weight_transform
### Keywords: PortfolioEffectHFT weight_transform

### ** Examples

## Not run: 
##D portfolio<-portfolio_create("SPY", "2014-11-19 09:30:00", "2014-11-19 16:00:00")
##D portfolio_settings(portfolio,portfolioMetricsMode="price",resultsSamplingInterval='1m')
##D position_AAPL=position_add(portfolio,"AAPL",1000)
##D position_GOOG=position_add(portfolio,"GOOG",1000)
##D position_SPY=position_add(portfolio,"SPY",1000)
##D 
##D optimizer=optimization_goal(variance(portfolio),direction="min")
##D optimizer=optimization_constraint(optimizer,value(portfolio),'=',10^9)
##D optimizer=optimization_constraint(optimizer,weight_transform(portfolio,
##D "sum_abs_weight",c(position_AAPL,position_GOOG)),">=",0.5)
##D plot(optimization_run(optimizer))
##D 
##D optimizer=optimization_goal(weight_transform(portfolio,"equiweight"))
##D plot(optimization_run(optimizer))
## End(Not run)


