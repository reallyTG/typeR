library(IntrinioStockAPI)


### Name: intrinio_fetch
### Title: Fetch Intrinio Data
### Aliases: intrinio_fetch

### ** Examples

api_username <- "[YOUR API USERNAME]"
api_password <- "[YOUR API PASSWORD]"
aapl_prices <- intrinio_fetch("api.intrinio.com/prices?ticker=AAPL", api_username, api_password)



