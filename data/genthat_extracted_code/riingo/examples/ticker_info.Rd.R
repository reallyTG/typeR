library(riingo)


### Name: is_supported_ticker
### Title: Ticker information
### Aliases: is_supported_ticker supported_tickers

### ** Examples


## Not run: 
##D 
##D # VOO is supported on both Tiingo and IEX
##D is_supported_ticker("VOO")
##D is_supported_ticker("VOO", type = "iex")
##D 
##D # PRHSX is a mutual fund that is supported by Tiingo but not IEX
##D is_supported_ticker("PRHSX")
##D is_supported_ticker("PRHSX", type = "iex")
##D 
##D # BTCUSD is available
##D is_supported_ticker("btcusd", type = "crypto")
##D 
## End(Not run)




