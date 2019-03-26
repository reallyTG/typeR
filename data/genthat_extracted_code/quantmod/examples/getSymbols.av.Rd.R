library(quantmod)


### Name: getSymbols.av
### Title: Download OHLC Data from Alpha Vantage
### Aliases: getSymbols.av getSymbols.alphavantage getSymbols.Alphavantage
###   getSymbols.alphVantage getSymbols.AlphVantage

### ** Examples

## Not run: 
##D # You'll need the API key given when you registered
##D getSymbols("IBM", src="av", api.key="yourKey")
##D 
##D # The default output.size="compact" returns only the most recent 100 rows.
##D # Set output.size="full" for all available data.
##D getSymbols("IBM", src="av", api.key="yourKey", output.size="full")
##D 
##D # Intraday data is available for the most recent 10 or 15 days
##D # and includes quasi-realtime data (i.e., 20-minute delayed)
##D getSymbols("IBM", src="av", api.key="yourKey", output.size="full",
##D   periodicity="intraday")
##D 
##D # Repeating your API key every time is tedious.
##D # Fortunately, you can set a global default.
##D setDefaults(getSymbols.av, api.key="yourKey")
##D getSymbols("IBM", src="av")
## End(Not run)



