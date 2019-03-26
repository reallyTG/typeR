library(estudy2)


### Name: get_rates_from_prices
### Title: Calculate rates of return for given prices.
### Aliases: get_rates_from_prices

### ** Examples

## Download historical prices of nine European insurance companies'
## stocks and estimate rates of returns form prices:
## Not run: 
##D library("magrittr")
##D tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE",
##D              "RSA.L", "TOP.CO")
##D rates <- tickers %>%
##D     get_prices_from_tickers(start = as.Date("2000-01-01"),
##D                             end = as.Date("2002-01-01"),
##D                             quote = "Close",
##D                             retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous")
## End(Not run)
## The result of the above code is stored in:
data(rates)

## Download historical prices of ESTX50 EUR P index and estimate rates of
## returns from prices:
## Not run: 
##D library("magrittr")
##D rates_indx <- get_prices_from_tickers("^STOXX50E",
##D                                       start = as.Date("2000-01-01"),
##D                                       end = as.Date("2002-01-01"),
##D                                       quote = "Close",
##D                                       retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous")
## End(Not run)
## The result of the above code is stored in:
data(rates_indx)




