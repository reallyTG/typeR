library(quantmod)


### Name: getSymbols.FRED
### Title: Download Federal Reserve Economic Data - FRED(R)
### Aliases: getSymbols.FRED
### Keywords: data

### ** Examples

## Not run: 
##D # All 3 getSymbols calls return the same
##D # CPI data to the global environment
##D # The last example is what NOT to do!
##D 
##D ## Method #1
##D getSymbols('CPIAUCNS',src='FRED')
##D 
##D 
##D ## Method #2
##D setDefaults(getSymbols,src='FRED')
##D   # OR
##D setSymbolLookup(CPIAUCNS='FRED')
##D 
##D getSymbols('CPIAUCNS')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #3
##D getSymbols.FRED('CPIAUCNS',env=globalenv())
## End(Not run)



