library(AlphaVantageClient)


### Name: fetchSeries
### Title: Fetch time series data
### Aliases: fetchSeries

### ** Examples

setAPIKey()
example_prices <- fetchSeries(function_nm = "time_series_daily", symbol = "msft")
example_sma <- fetchSeries(function_nm = "sma", symbol = "msft", interval = "daily",
                           time_period = 10, series_type = "open")



