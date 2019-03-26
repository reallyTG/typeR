library(tsbox)


### Name: ts_lag
### Title: Lag or Lead of Time Series
### Aliases: ts_lag

### ** Examples

## No test: 
ts_plot(AirPassengers, ts_lag(AirPassengers), title = "Illustrating the need for glasses")
## End(No test)
head(ts_lag(AirPassengers, "1 month"))
head(ts_lag(AirPassengers, "1 year"))
head(ts_lag(ts_df(AirPassengers), "2 day"))
# head(ts_lag(ts_df(AirPassengers), "2 min")) not yet working



