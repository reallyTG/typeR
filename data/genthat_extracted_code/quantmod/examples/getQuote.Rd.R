library(quantmod)


### Name: getQuote
### Title: Download Current Stock Quote
### Aliases: getQuote standardQuote yahooQF yahooQuote.EOD
### Keywords: IO data

### ** Examples

yahooQuote.EOD
## Not run: 
##D getQuote("AAPL")
##D getQuote("QQQQ;SPY;^VXN",what=yahooQF(c("Bid","Ask")))
##D standardQuote()
##D yahooQF()
## End(Not run)



