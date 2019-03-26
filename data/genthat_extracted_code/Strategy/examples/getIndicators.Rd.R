library(Strategy)


### Name: getIndicators
### Title: Get indicators from 'Strategy'-object
### Aliases: getIndicators getIndicators,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
randreturns <- xts::xts(rnorm(nrow(assets)), order.by=
seq(from=Sys.Date()-nrow(assets)+1, to=Sys.Date(), by="d"))
indicators <- list(returns=randreturns) # example: random returns
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params, indicators=indicators)

# Get indicator data from MA(200)-Strategy
getIndicators(myStrat.MA, from="2015-01-01", until="2015-12-31")

##End(Not run)



