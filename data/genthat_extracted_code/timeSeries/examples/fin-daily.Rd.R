library(timeSeries)


### Name: SpecialDailySeries
### Title: Special Daily Time Series
### Aliases: daily dummyDailySeries dummySeries alignDailySeries
###   rollDailySeries
### Keywords: chron

### ** Examples

## Use Microsofts' OHLCV Price Series -
   head(MSFT)
   end(MSFT)

## Cut out April Data from 2001 -
   Close <- MSFT[, "Close"]
   tsApril01 <- window(Close, start="2001-04-01", end="2001-04-30")
   tsApril01

## Align Daily Series with NA -
   tsRet <- returns(tsApril01, trim = TRUE)
   GoodFriday(2001)
   EasterMonday(2001)
   alignDailySeries(tsRet, method = "fillNA", include.weekends = FALSE)
   alignDailySeries(tsRet, method = "fillNA", include.weekends = TRUE)

## Align Daily Series by Interpolated Values -
   alignDailySeries(tsRet, method = "interp", include.weekend = FALSE)
   alignDailySeries(tsRet, method = "interp", include.weekend = TRUE)



