library(obAnalytics)


### Name: plotCurrentDepth
### Title: Visualise order book depth at any given point in time.
### Aliases: plotCurrentDepth

### ** Examples


# get a limit order book for a specific point in time, limited to +- 150bps
# above/below best bid/ask price.
lob <- orderBook(lob.data$events,
    tp=as.POSIXct("2015-05-01 04:38:17.429", tz="UTC"), bps.range=150)

# visualise the order book liquidity.
plotCurrentDepth(lob, volume.scale=10^-8)




