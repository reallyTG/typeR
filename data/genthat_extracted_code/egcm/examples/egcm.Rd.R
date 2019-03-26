library(egcm)


### Name: egcm
### Title: Simplified Engle-Granger Cointegration Model
### Aliases: egcm plot.egcm summary.egcm is.cointegrated is.ar1
### Keywords: models ts

### ** Examples

## Not run: 
##D library(quantmod)
##D 
##D # SPY and IVV are both ETF's that track the S&P 500.
##D # One would expect them to be cointegrated, and in 2013 they were.
##D spy2013 <- getSymbols("SPY", from = "2013-01-01",
##D           to = "2013-12-31",auto.assign = FALSE)$SPY.Adjusted
##D ivv2013 <- getSymbols("IVV", from = "2013-01-01", 
##D          to = "2013-12-31",auto.assign = FALSE)$IVV.Adjusted
##D egcm(spy2013, ivv2013)
##D 
##D # egcm has a plot method, which can be useful
##D # In this plot, it appears that there is only one price series,
##D # but that is because the two price series are so close to each
##D # other that they are indistinguishable.
##D plot(egcm(spy2013, ivv2013))
##D 
##D # The yegcm method provides a convenient interface to the quantmod
##D # package, which can fetch closing prices from Yahoo.  Thus, 
##D # the above can be simplified as follows:
##D 
##D e <- yegcm("SPY", "VOO", start="2013-01-01", end="2014-01-01")
##D print(e)
##D plot(e)
##D summary(e)
##D 
##D # GLD and IAU both track the price of gold.  
##D # They too tend to be very tightly cointegrated.
##D gld.iau.2013 <- yegcm("GLD", "IAU", start="2013-01-01", end="2013-12-31")
##D gld.iau.2013
##D plot(gld.iau.2013)
##D 
##D # Coca-cola and Pepsi are often mentioned as an
##D # example of a pair of securities for which pairs trading
##D # may be fruitful.  However, at least in 2013, they were not
##D # cointegrated.
##D ko.pep.2013 <- yegcm("KO", "PEP", start="2013-01-01", end="2013-12-31")
##D ko.pep.2013
##D plot(ko.pep.2013)
##D 
##D # Ford and GM seemed to be even more tightly linked.
##D # Yet, the degree of linkage was not high enough to pass the
##D # cointegration test.
##D f.gm.2013 <- yegcm("F","GM", start="2013-01-01", end="2013-12-31")
##D f.gm.2013
##D plot(f.gm.2013)
## End(Not run)


