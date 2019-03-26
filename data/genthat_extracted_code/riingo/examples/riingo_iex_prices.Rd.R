library(riingo)


### Name: riingo_iex_prices
### Title: Get stock or ETF prices from IEX through Tiingo
### Aliases: riingo_iex_prices

### ** Examples


## Not run: 
##D 
##D # Pulling all available minute level data for Apple
##D riingo_iex_prices("AAPL", resample_frequency = "1min")
##D 
##D # This would result in an error, as you are pulling outside the available range
##D # riingo_iex_prices("AAPL", "1990-01-01", "2000-01-01", resample_frequency = "5min")
##D 
## End(Not run)




