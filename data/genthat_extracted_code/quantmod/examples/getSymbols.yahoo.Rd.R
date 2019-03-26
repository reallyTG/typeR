library(quantmod)


### Name: getSymbols.yahoo
### Title: Download OHLC Data From Yahoo Finance
### Aliases: getSymbols.yahoo
### Keywords: data

### ** Examples

## Not run: 
##D # All 3 getSymbols calls return the same
##D # MSFT to the global environment
##D # The last example is what NOT to do!
##D 
##D ## Method #1
##D getSymbols('MSFT',src='yahoo')
##D 
##D 
##D ## Method #2
##D setDefaults(getSymbols,src='yahoo')
##D   # OR
##D setSymbolLookup(MSFT='yahoo')
##D 
##D getSymbols('MSFT')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #3
##D getSymbols.yahoo('MSFT',env=globalenv())
## End(Not run)



