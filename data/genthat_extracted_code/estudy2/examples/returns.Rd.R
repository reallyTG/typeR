library(estudy2)


### Name: returns
### Title: Constructor of an object of S3 class 'returns'.
### Aliases: returns

### ** Examples

## 1. Mean-adjusted-returns model
## Not run: 
##D library("magrittr")
##D single_return <- get_prices_from_tickers("ALV.DE",
##D                                          start = as.Date("2000-01-01"),
##D                                          end = as.Date("2002-01-01"),
##D                                          quote = "Close",
##D                                          retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     returns(market_model = "mean_adj",
##D             estimation_start = as.Date("2001-03-26"),
##D             estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates)
single_return <- returns(rates[, "ALV.DE", drop = FALSE],
                         market_model = "mean_adj",
                         estimation_start = as.Date("2001-03-26"),
                         estimation_end = as.Date("2001-09-10"))

## 2. Market-adjusted-returns model
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
##D 
##D single_return <- get_prices_from_tickers("ALV.DE",
##D                                          start = as.Date("2000-01-01"),
##D                                          end = as.Date("2002-01-01"),
##D                                          quote = "Close",
##D                                          retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     returns(regressor = rates_indx,
##D             market_model = "mrkt_adj",
##D             estimation_start = as.Date("2001-03-26"),
##D             estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates, rates_indx)
single_return <- returns(rates = rates[, "ALV.DE", drop = FALSE],
                         regressor = rates_indx,
                         market_model = "mrkt_adj",
                         estimation_method = "ols",
                         estimation_start = as.Date("2001-03-26"),
                         estimation_end = as.Date("2001-09-10"))

## 3. Single-index market model
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
##D 
##D single_return <- get_prices_from_tickers("ALV.DE",
##D                                          start = as.Date("2000-01-01"),
##D                                          end = as.Date("2002-01-01"),
##D                                          quote = "Close",
##D                                          retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     returns(regressor = rates_indx,
##D             market_model = "sim",
##D             estimation_method = "ols",
##D             estimation_start = as.Date("2001-03-26"),
##D             estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates, rates_indx)
single_return <- returns(rates = rates[, "ALV.DE", drop = FALSE],
                         regressor = rates_indx,
                         market_model = "sim",
                         estimation_method = "ols",
                         estimation_start = as.Date("2001-03-26"),
                         estimation_end = as.Date("2001-09-10"))




