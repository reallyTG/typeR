library(obAnalytics)


### Name: plotEventMap
### Title: Plot limit order event map.
### Aliases: plotEventMap

### ** Examples


## Not run: 
##D 
##D # plot all orders 
##D with(lob.data, plotEventMap(events))
## End(Not run)

# 1 hour of activity and re-scale the volume
with(lob.data, plotEventMap(events,
    start.time=as.POSIXct("2015-05-01 03:30:00.000", tz="UTC"),
    end.time=as.POSIXct("2015-05-01 04:00:00.000", tz="UTC"),
    volume.scale=10^-8))

# 15 minutes of activity >= 5 (re-scaled) volume within price range
# $ [220, 245]
with(lob.data, plotEventMap(events,
    start.time=as.POSIXct("2015-05-01 03:30:00.000", tz="UTC"),
    end.time=as.POSIXct("2015-05-01 03:45:00.000", tz="UTC"),
    price.from=220,
    price.to=245,
    volume.from=5,
    volume.scale=10^-8))




