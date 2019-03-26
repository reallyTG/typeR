library(Strategy)


### Name: getStratFUN
### Title: Get strategy function from 'Strategy'-object
### Aliases: getStratFUN getStratFUN,Strategy-method

### ** Examples

##Not run:

# MA(200)-Strategy
params <- list(k=200)
myStrat.MA <- Strategy(assets=assets, strat="MA", strat.params=params)

# Get strategy function from MA(200)-Strategy
MA.FUN <- getStratFUN(myStrat.MA)

##End(Not run)



