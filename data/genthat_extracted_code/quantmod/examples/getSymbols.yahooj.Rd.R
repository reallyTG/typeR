library(quantmod)


### Name: getSymbols.yahooj
### Title: Download OHLC Data From Yahoo! Japan Finance
### Aliases: getSymbols.yahooj
### Keywords: data

### ** Examples

## Not run: 
##D # All 4 getSymbols calls return the same
##D # Sony (6758.T) OHLC to the global environment
##D # The last example is what NOT to do!
##D 
##D ## Method #1
##D getSymbols('6758.T',src='yahooj')
##D 
##D 
##D ## Method #2
##D getSymbols('YJ6758.T',src='yahooj')
##D 
##D 
##D ## Method #3
##D setDefaults(getSymbols,src='yahooj')
##D   # OR
##D setSymbolLookup(YJ6758.T='yahooj')
##D 
##D getSymbols('YJ6758.T')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #4
##D getSymbols.yahooj('6758.T',env=globalenv())
## End(Not run)



