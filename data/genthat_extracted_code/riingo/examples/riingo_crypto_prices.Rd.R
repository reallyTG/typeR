library(riingo)


### Name: riingo_crypto_prices
### Title: Get cryptocurrency prices aggregated through Tiingo
### Aliases: riingo_crypto_prices

### ** Examples


## Not run: 
##D 
##D # Bitcoin prices
##D riingo_crypto_prices("btcusd")
##D 
##D # Bitcoin in USD and EUR
##D riingo_crypto_prices(c("btcusd", "btceur"), start_date = "2018-01-01", resample_frequency = "5min")
##D 
##D # Bitcoin raw data
##D riingo_crypto_prices("btcusd", raw = TRUE)
##D 
##D # Only use the POLONIEX exchange
##D riingo_crypto_prices("btcusd", raw = TRUE, exchanges = "POLONIEX")
##D 
##D # All btc___ crypotcurrency pairs
##D riingo_crypto_prices(base_currency = "btc")
##D 
## End(Not run)




