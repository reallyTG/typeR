library(obAnalytics)


### Name: plotVolumeMap
### Title: Visualise flashed-limit order volume.
### Aliases: plotVolumeMap

### ** Examples


# plot all fleeting limit order volume using logarithmic scale.
with(lob.data, plotVolumeMap(events, volume.scale=10^-8, log.scale=TRUE))

# "fleeting" order volume within 1 hour range up until 10 units of volume.
with(lob.data, plotVolumeMap(events, volume.scale=10^-8,
    start.time=as.POSIXct("2015-05-01 02:30:00.000", tz="UTC"),
    end.time=as.POSIXct("2015-05-01 03:30:00.000", tz="UTC"),
    volume.to=10))




