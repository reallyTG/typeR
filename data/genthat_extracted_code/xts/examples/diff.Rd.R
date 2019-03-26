library(xts)


### Name: diff.xts
### Title: Lags and Differences of xts Objects
### Aliases: diff.xts lag.xts lagts.xts
### Keywords: manip chron

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
lag(x)    # currently using xts-style positive k 

lag(x, k=2)

lag(x, k=-1, na.pad=FALSE) # matches lag.zoo(x, k=1)

diff(x)
diff(x, lag=1)
diff(x, diff=2)
diff(diff(x))



