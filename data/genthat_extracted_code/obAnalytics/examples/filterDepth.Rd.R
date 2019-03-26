library(obAnalytics)


### Name: filterDepth
### Title: Filter price level volume.
### Aliases: filterDepth

### ** Examples


# obtain price level volume for a 15 minute window.
filtered <- with(lob.data, filterDepth(depth,
    from=as.POSIXct("2015-05-01 02:45:00.000", tz="UTC"),
    to=as.POSIXct("2015-05-01 03:00:00.000", tz="UTC")))

# top 5 most active price levels during this 15 minute window.
head(sort(tapply(filtered$volume, filtered$price, length),
    decreasing=TRUE), 5)

# extract available volume for price level 233.78, then plot it.
level.233.78 <- filtered[filtered$price == 233.78, c("timestamp", "volume")]
plotTimeSeries(level.233.78$timestamp, level.233.78$volume*10^-8)




