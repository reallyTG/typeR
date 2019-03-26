library(estudy2)


### Name: get_prices_from_tickers
### Title: Get daily prices of securities.
### Aliases: get_prices_from_tickers

### ** Examples

## Download historical prices of nine European insurance companies'
## stocks:
## Not run: 
##D library("magrittr")
##D tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE",
##D              "RSA.L", "TOP.CO")
##D prices <- tickers %>%
##D     get_prices_from_tickers(start = as.Date("2000-01-01"),
##D                             end = as.Date("2002-01-01"),
##D                             quote = "Close",
##D                             retclass = "zoo")
## End(Not run)
## The result of the above code is stored in:
data(prices)

## Download historical prices of ESTX50 EUR P index:
## Not run: 
##D prices_indx <- get_prices_from_tickers("^STOXX50E",
##D                                        start = as.Date("2000-01-01"),
##D                                        end = as.Date("2002-01-01"),
##D                                        quote = "Close",
##D                                        retclass = "zoo")
## End(Not run)
## The result of the above code is stored in:
data(prices_indx)




