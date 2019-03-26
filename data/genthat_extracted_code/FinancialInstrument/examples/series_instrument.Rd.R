library(FinancialInstrument)


### Name: future_series
### Title: Constructors for series contracts
### Aliases: future_series option_series bond_series option_series
###   bond_series

### ** Examples

## Not run: 
##D currency("USD")
##D future("ES","USD",multiplier=50, tick_size=0.25)
##D future_series('ES_U1')
##D future_series(root_id='ES',suffix_id='Z11')
##D stock('SPY','USD')
##D option('.SPY','USD',multiplier=100,underlying_id='SPY')
##D #can use either .SPY or SPY for the root_id. 
##D #it will find the one that is option specs.
##D option_series('SPY_110917C125', expires='2011-09-16')
##D option_series(root_id='SPY',suffix_id='111022P125')
##D option_series(root_id='.SPY',suffix_id='111119C130')
##D #multiple series instruments at once.
##D future_series(c("ES_H12","ES_M12"))
##D option_series(c("SPY_110917C115","SPY_110917P115"))
## End(Not run)



