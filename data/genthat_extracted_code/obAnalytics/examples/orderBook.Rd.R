library(obAnalytics)


### Name: orderBook
### Title: Instantaneous limit order book reconstruction.
### Aliases: orderBook

### ** Examples


tp <- as.POSIXct("2015-05-01 04:25:15.342", tz="UTC")
orderBook(lob.data$events, max.levels=5)




