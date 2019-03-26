library(timeSeries)


### Name: plot-methods
### Title: Plot a Time Series
### Aliases: plot plot,timeSeries-method lines,timeSeries-method
###   points,timeSeries-method pretty.timeSeries
### Keywords: chron

### ** Examples

## Load Swiss Pension Fund Benchmark Data -
   LPP <- LPP2005REC[1:12, 1:4]
   colnames(LPP) <- abbreviate(colnames(LPP), 2)
   finCenter(LPP) <- "GMT"

## Example Plot 1 -
   plot(LPP[, 1], type = "o", col = "steelblue",
     main = "LPP", xlab = "2005", ylab = "Return")
   plot(LPP[, 1], at="auto", type = "o", col = "steelblue",
     main = "LPP", xlab = "2005", ylab = "Return")

## Example Plot 2 -
   plot(LPP[, 1:2], type = "o", col = "steelblue",
     main = "LPP", xlab = "2005", ylab = "Return")

## Example Plot 3 -
   plot(LPP[, 1], LPP[, 2], type = "p", col = "steelblue",
     main = "LPP", xlab = "Return 1", ylab = "Return 2")

## Example Plot 4a, The Wrong Way to do it! -
   LPP <- as.timeSeries(data(LPP2005REC))
   ZRH <- as.timeSeries(LPP[,"SPI"], zone = "Zurich", FinCenter = "Zurich")
   NYC <- as.timeSeries(LPP[,"LMI"], zone = "NewYork", FinCenter = "NewYork")
   finCenter(ZRH)
   finCenter(NYC)
   plot(ZRH, at="auto", type = "p", pch = 19, col = "blue")
   points(NYC, pch = 19, col = "red")

## Example Plot 4b, Convert NYC to Zurich Time -
   finCenter(ZRH) <- "Zurich"
   finCenter(NYC) <- "Zurich"
   at <- unique(round(time(ZRH)))
   plot(ZRH, type = "p", pch = 19, col = "blue", format = "%b %d", at = at,
       xlab = paste(ZRH@FinCenter, "local Time"), main = ZRH@FinCenter)
   points(NYC, pch = 19, col = "red")

## Example 4c, Force Everything to GMT Using "FinCenter" Argument -
   finCenter(ZRH) <- "Zurich"
   finCenter(NYC) <- "NewYork"
   at <- unique(round(time(ZRH)))
   plot(ZRH, type = "p", pch = 19, col = "blue", format = "%b %d", at = at,
       FinCenter = "GMT", xlab = "GMT", main = "ZRH - GMT")
   points(NYC, FinCenter = "GMT", pch = 19, col = "red")



