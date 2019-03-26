library(obAnalytics)


### Name: plotTimeSeries
### Title: General purpose time series plot.
### Aliases: plotTimeSeries

### ** Examples


# plot trades.
with(lob.data$trades, plotTimeSeries(timestamp, price))

# plot a general time series.
timestamp <- seq(as.POSIXct("2015-05-01 00:00:00.000", tz="UTC"), 
                 as.POSIXct("2015-05-01 00:59:00.000", tz="UTC"), by=60)
series <- rep(1:10, 6)
plotTimeSeries(timestamp, series)




