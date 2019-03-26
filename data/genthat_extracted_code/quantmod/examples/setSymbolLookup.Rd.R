library(quantmod)


### Name: setSymbolLookup
### Title: Manage Symbol Lookup Table
### Aliases: setSymbolLookup getSymbolLookup loadSymbolLookup
###   saveSymbolLookup
### Keywords: utilities

### ** Examples

setSymbolLookup(QQQQ='yahoo',DIA='MySQL')
getSymbolLookup('QQQQ')
getSymbolLookup(c('QQQQ','DIA'))

## Not run: 
##D ## Will download QQQQ from yahoo
##D ## and load DIA from MySQL
##D getSymbols(c('QQQQ','DIA'))
## End(Not run)

## Use something like this to always retrieve
## from the same source

.First <- function() {
  require(quantmod,quietly=TRUE)
  quantmod::setSymbolLookup(JAVA="MySQL")
}

## OR

saveSymbolLookup()
loadSymbolLookup()



