library(tsbox)


### Name: ts_c
### Title: Collect Time Series
### Aliases: ts_c

### ** Examples

head(ts_c(ts_df(EuStockMarkets), AirPassengers))

# labeling
x <- ts_c(
  `International Airline Passengers` = ts_xts(AirPassengers),
  `Deaths from Lung Diseases` = ldeaths
)
head(x)




