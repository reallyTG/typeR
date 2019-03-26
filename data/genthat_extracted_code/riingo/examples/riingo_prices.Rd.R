library(riingo)


### Name: riingo_prices
### Title: Get stock or ETF prices from the Tiingo API
### Aliases: riingo_prices

### ** Examples


## Not run: 
##D 
##D # Downloading 1 year's worth of prices for AAPL
##D riingo_prices("AAPL")
##D 
##D # Downloading a range of data, using 2 tickers
##D riingo_prices(c("AAPL", "MSFT"), "1999-01-01", "2005-01-01")
##D 
##D # Monthly data
##D riingo_prices(c("AAPL", "MSFT"), "1999-01-01", "2005-01-01", "monthly")
##D 
## End(Not run)




