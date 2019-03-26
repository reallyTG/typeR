library(timeSeries)


### Name: spreads
### Title: Spreads and Mid Quotes
### Aliases: spreads midquotes spreadSeries midquoteSeries
### Keywords: chron

### ** Examples

## Load the Microsoft Data -  
   setRmetricsOptions(myFinCenter = "GMT")
   data(MSFT)
   X = MSFT[1:10, ]
   head(X)

## Compute Open/Close Midquotes -
   X.MID <- midquotes(X, which = c("Close", "Open"))
   colnames(X.MID) <- "X.MID"
   X.MID

## Compute Open/Close Spreads -
   X.SPREAD <- spreads(X, which = c("Close", "Open"))
   colnames(X.SPREAD) <- "X.SPREAD"
   X.SPREAD



