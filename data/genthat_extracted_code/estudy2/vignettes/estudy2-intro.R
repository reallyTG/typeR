## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(estudy2)
tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE", "RSA.L",
             "TOP.CO")
prices <- get_prices_from_tickers(tickers, 
                                  start = as.Date("2000-01-01"),
                                  end = as.Date("2002-01-01"),
                                  quote = "Close",
                                  retclass = "zoo")

## ---- message=FALSE, warning=FALSE---------------------------------------
prices_indx <- get_prices_from_tickers("^STOXX50E",
                                       start = as.Date("2000-01-01"),
                                       end = as.Date("2002-01-01"),
                                       quote = "Close",
                                       retclass = "zoo")

## ------------------------------------------------------------------------
rates <- get_rates_from_prices(prices,
                               quote = "Close",
                               multi_day = TRUE,
                               compounding = "continuous")

rates_indx <- get_rates_from_prices(prices_indx, 
                                    quote = "Close",
                                    multi_day = TRUE,
                                    compounding = "continuous")

## ------------------------------------------------------------------------
securities_returns <- apply_market_model(
    rates = rates,
    regressor = rates_indx,
    same_regressor_for_all = TRUE,
    market_model = "sim",
    estimation_method = "ols",
    estimation_start = as.Date("2001-03-26"),
    estimation_end = as.Date("2001-09-10")
)

## ------------------------------------------------------------------------
parametric_tests(list_of_returns = securities_returns,
                 event_start = as.Date("2001-09-11"),
                 event_end = as.Date("2001-09-28"))

nonparametric_tests(list_of_returns = securities_returns,
                    event_start = as.Date("2001-09-11"),
                    event_end = as.Date("2001-09-28"))


## ---- message=FALSE, warning=FALSE---------------------------------------
library(magrittr)

rates_indx <- get_prices_from_tickers("^STOXX50E",
                                      start = as.Date("2000-01-01"),
                                      end = as.Date("2002-01-01"),
                                      quote = "Close",
                                      retclass = "zoo") %>%
    get_rates_from_prices(quote = "Close",
                          multi_day = TRUE,
                          compounding = "continuous")

tickers <- c("ALV.DE", "CS.PA", "G.MI", "HNR1.HA", "HSX.L", "MUV2.DE", "RSA.L",
             "TOP.CO")
nine_eleven_param <- get_prices_from_tickers(tickers,
                                             start = as.Date("2000-01-01"),
                                             end = as.Date("2002-01-01"),
                                             quote = "Close",
                                             retclass = "zoo") %>%
    get_rates_from_prices(quote = "Close",
                          multi_day = TRUE,
                          compounding = "continuous") %>%
    apply_market_model(regressor = rates_indx,
                       same_regressor_for_all = TRUE,
                       market_model = "sim",
                       estimation_method = "ols",
                       estimation_start = as.Date("2001-03-26"),
                       estimation_end = as.Date("2001-09-10")) %>%
    parametric_tests(event_start = as.Date("2001-09-11"),
                     event_end = as.Date("2001-09-28"))

