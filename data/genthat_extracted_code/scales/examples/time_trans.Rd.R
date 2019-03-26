library(scales)


### Name: time_trans
### Title: Transformation for date-times (class POSIXt).
### Aliases: time_trans

### ** Examples

hours <- seq(ISOdate(2000,3,20, tz = ""), by = "hour", length.out = 10)
t <- time_trans()
t$transform(hours)
t$inverse(t$transform(hours))
t$format(t$breaks(range(hours)))



