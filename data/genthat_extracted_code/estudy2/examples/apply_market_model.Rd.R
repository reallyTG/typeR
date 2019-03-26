library(estudy2)


### Name: apply_market_model
### Title: Apply a market model and return a list of 'returns' objects.
### Aliases: apply_market_model

### ** Examples

## 1. Mean-adjusted-returns model
## Not run: 
##D library("magrittr")
##D tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE",
##D              "RSA.L", "TOP.CO")
##D securities_returns <- get_prices_from_tickers(tickers,
##D                                               start = as.Date("2000-01-01"),
##D                                               end = as.Date("2002-01-01"),
##D                                               quote = "Close",
##D                                               retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     apply_market_model(market_model = "mean_adj",
##D                        estimation_start = as.Date("2001-03-26"),
##D                        estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates)
securities_returns <- apply_market_model(
    rates,
    market_model = "mean_adj",
    estimation_start = as.Date("2001-03-26"),
    estimation_end = as.Date("2001-09-10")
)

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
##D tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE",
##D              "RSA.L", "TOP.CO")
##D securities_returns <- get_prices_from_tickers(tickers,
##D                                               start = as.Date("2000-01-01"),
##D                                               end = as.Date("2002-01-01"),
##D                                               quote = "Close",
##D                                               retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     apply_market_model(regressor = rates_indx,
##D                        same_regressor_for_all = TRUE,
##D                        market_model = "mrkt_adj",
##D                        estimation_start = as.Date("2001-03-26"),
##D                        estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates, rates_indx)
securities_returns <- apply_market_model(
    rates = rates,
    regressor = rates_indx,
    same_regressor_for_all = TRUE,
    market_model = "mrkt_adj",
    estimation_start = as.Date("2001-03-26"),
    estimation_end = as.Date("2001-09-10")
)

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
##D tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE",
##D              "RSA.L", "TOP.CO")
##D securities_returns <- get_prices_from_tickers(tickers,
##D                                               start = as.Date("2000-01-01"),
##D                                               end = as.Date("2002-01-01"),
##D                                               quote = "Close",
##D                                               retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     apply_market_model(regressor = rates_indx,
##D                        same_regressor_for_all = TRUE,
##D                        market_model = "sim",
##D                        estimation_method = "ols",
##D                        estimation_start = as.Date("2001-03-26"),
##D                        estimation_end = as.Date("2001-09-10"))
## End(Not run)
## The result of the code above is equivalent to:
data(rates, rates_indx)
securities_returns <- apply_market_model(
    rates = rates,
    regressor = rates_indx,
    same_regressor_for_all = TRUE,
    market_model = "sim",
    estimation_method = "ols",
    estimation_start = as.Date("2001-03-26"),
    estimation_end = as.Date("2001-09-10")
)




