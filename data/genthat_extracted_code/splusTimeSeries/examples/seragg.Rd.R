library(splusTimeSeries)


### Name: aggregateSeries
### Title: Time Series and Signal Aggregation
### Aliases: aggregateSeries
### Keywords: ts

### ** Examples

x <- timeSeries(data.frame(1:20,rnorm(20)), timeCalendar(d=1:20))
aggregate(x, FUN=mean, by="weeks")



