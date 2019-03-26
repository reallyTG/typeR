library(zoo)


### Name: lag.zoo
### Title: Lags and Differences of zoo Objects
### Aliases: lag.zoo diff.zoo
### Keywords: ts

### ** Examples

x <- zoo(11:21)

lag(x, k = 1)
lag(x, k = -1)
# this pairs each value of x with the next or future value
merge(x, lag1 = lag(x, k=1))
diff(x^3)
diff(x^3, -1)
diff(x^3, na.pad = TRUE)




