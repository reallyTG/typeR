library(quantmod)


### Name: getSymbols.MySQL
### Title: Retrieve Data from MySQL Database
### Aliases: getSymbols.MySQL getSymbols.mysql
### Keywords: data

### ** Examples

## Not run: 
##D # All 3 getSymbols calls return the same
##D # MSFT to the global environment
##D # The last example is what NOT to do!
##D 
##D setDefaults(getSymbols.MySQL,user='jdoe',password='secret',
##D             dbname='tradedata')
##D 
##D ## Method #1
##D getSymbols('MSFT',src='MySQL')
##D 
##D 
##D ## Method #2
##D setDefaults(getSymbols,src='MySQL')
##D   # OR
##D setSymbolLookup(MSFT='MySQL')
##D 
##D getSymbols('MSFT')
##D 
##D #########################################
##D ##  NOT RECOMMENDED!!!
##D #########################################
##D ## Method #3
##D getSymbols.MySQL('MSFT',env=globalenv())
## End(Not run)



