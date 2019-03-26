library(quantmod)


### Name: getSymbols.csv
### Title: Load Data from csv File
### Aliases: getSymbols.csv
### Keywords: data

### ** Examples

## Not run: 
##D # All 3 getSymbols calls return the same
##D # MSFT to the global environment
##D # The last example is what NOT to do!
##D 
##D ## Method #1
##D getSymbols('MSFT',src='csv')
##D 
##D 
##D ## Method #2
##D setDefaults(getSymbols,src='csv')
##D   # OR
##D setSymbolLookup(MSFT='csv')
##D 
##D getSymbols('MSFT')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #3
##D getSymbols.csv('MSFT',verbose=TRUE,env=globalenv())
## End(Not run)



