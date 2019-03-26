library(tsbox)


### Name: ts_frequency
### Title: Change Frequency
### Aliases: ts_frequency

### ** Examples

ts_frequency(cbind(mdeaths, fdeaths), "year", "sum")
ts_frequency(cbind(mdeaths, fdeaths), "year", "sum")
ts_frequency(cbind(mdeaths, fdeaths), "quarter", "last")

ts_frequency(AirPassengers, 4, "sum")
ts_frequency(AirPassengers, 1, "sum")

# Note that incomplete years are omited by default
ts_frequency(EuStockMarkets, "year")
ts_frequency(EuStockMarkets, "year", na.rm = TRUE)




