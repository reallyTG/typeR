library(obAnalytics)


### Name: plotEventsHistogram
### Title: Plot a histogram given event data.
### Aliases: plotEventsHistogram

### ** Examples


# necessary columns from event data.
events <- lob.data$events[, c("timestamp", "direction", "price", "volume")]

# re-scale volume (if needed)
events$volume <- events$volume * 10^-8

# histogram of all volume aggregated into 5 unit buckets.
plotEventsHistogram(events[events$volume < 50, ], val="volume", bw=5)

# histogram of 99% of limit prices during a 1 hour time frame.
# bar width set to 0.25: counts are aggregated into 25 cent buckets. 
plotEventsHistogram(events[events$price <= quantile(events$price, 0.99)
                    & events$price >= quantile(events$price, 0.01), ],
    start.time=as.POSIXct("2015-05-01 02:15:00.000", tz="UTC"),
    end.time=as.POSIXct("2015-05-01 03:15:00.000", tz="UTC"),
    val="price", bw=0.25)




