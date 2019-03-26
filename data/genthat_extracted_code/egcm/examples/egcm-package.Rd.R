library(egcm)


### Name: egcm-package
### Title: Simplified Engle-Granger Cointegration Models
### Aliases: egcm-package
### Keywords: package models ts

### ** Examples

## Not run: 
##D library(quantmod)
##D prices.spy <- getSymbols("SPY", from="2013-01-01", to="2014-01-01",
##D                           auto.assign = FALSE)$SPY.Adjusted
##D prices.voo <- getSymbols("VOO", from="2013-01-01", to="2014-01-01",
##D                           auto.assign = FALSE)$VOO.Adjusted
##D egcm(prices.spy, prices.voo)
##D plot(egcm(prices.spy, prices.voo))
##D summary(egcm(prices.spy, prices.voo))
##D 
##D # The yegcm method provides a convenient interface to the TTR
##D # package, which can fetch closing prices from Yahoo.  Thus, 
##D # the above can be simplified as follows:
##D 
##D e <- yegcm("SPY", "VOO", start="2013-01-01", end="2014-01-01")
##D print(e)
##D plot(e)
##D summary(e)
## End(Not run)


