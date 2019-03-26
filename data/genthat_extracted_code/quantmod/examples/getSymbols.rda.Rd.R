library(quantmod)


### Name: getSymbols.rda
### Title: Load Data from R Binary File
### Aliases: getSymbols.rda getSymbols.RData
### Keywords: data

### ** Examples

## Not run: 
##D # All 3 getSymbols calls return the same
##D # MSFT to the global environment
##D # The last example is what NOT to do!
##D 
##D ## Method #1
##D getSymbols('MSFT',src='rda')
##D getSymbols('MSFT',src='RData')
##D 
##D 
##D ## Method #2
##D setDefaults(getSymbols,src='rda')
##D   # OR
##D setSymbolLookup(MSFT='rda')
##D   # OR
##D setSymbolLookup(MSFT=list(src='rda'))
##D 
##D getSymbols('MSFT')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #3
##D getSymbols.rda('MSFT',verbose=TRUE,env=globalenv())
## End(Not run)



