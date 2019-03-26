library(quantmod)


### Name: getSymbols.tiingo
### Title: Download OHLC Data from Tiingo
### Aliases: getSymbols.tiingo

### ** Examples

## Not run: 
##D # You'll need the API key given when you registered
##D getSymbols("IBM", src="tiingo", api.key="yourKey")
##D 
##D # Repeating your API key every time is tedious.
##D # Fortunately, you can set a global default.
##D setDefaults(getSymbols.tiingo, api.key="yourKey")
##D getSymbols("IBM", src="tiingo")
## End(Not run)



