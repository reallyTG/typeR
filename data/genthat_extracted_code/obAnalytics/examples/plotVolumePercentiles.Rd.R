library(obAnalytics)


### Name: plotVolumePercentiles
### Title: Visualise available limit order book liquidity through time.
### Aliases: plotVolumePercentiles

### ** Examples


# visualise 2 hours of order book liquidity.
# data will be aggregated to minute-by-minute resolution.
plotVolumePercentiles(lob.data$depth.summary,
    start.time=as.POSIXct("2015-05-01 02:30:00.000", tz="UTC"),
    end.time=as.POSIXct("2015-05-01 04:30:00.000", tz="UTC"),
    volume.scale=10^-8)

## Not run: 
##D 
##D # visualise 15 minutes of order book liquidity.
##D # data will be aggregated to second-by-second resolution.
##D plotVolumePercentiles(lob.data$depth.summary,
##D     start.time=as.POSIXct("2015-05-01 04:30:00.000", tz="UTC"),
##D     end.time=as.POSIXct("2015-05-01 04:35:00.000", tz="UTC"),
##D     volume.scale=10^-8)
## End(Not run)



