library(estudy2)


### Name: car_parametric_tests
### Title: Returns the result of given event study parametric CAR tests.
### Aliases: car_parametric_tests

### ** Examples

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
##D nine_eleven_car_param <- get_prices_from_tickers(tickers,
##D                                                  start = as.Date("2000-01-01"),
##D                                                  end = as.Date("2002-01-01"),
##D                                                  quote = "Close",
##D                                                  retclass = "zoo") %>%
##D     get_rates_from_prices(quote = "Close",
##D                           multi_day = TRUE,
##D                           compounding = "continuous") %>%
##D     apply_market_model(regressor = rates_indx,
##D                        same_regressor_for_all = TRUE,
##D                        market_model = "sim",
##D                        estimation_method = "ols",
##D                        estimation_start = as.Date("2001-03-26"),
##D                        estimation_end = as.Date("2001-09-10")) %>%
##D     car_parametric_tests(car_start = as.Date("2001-09-11"),
##D                          car_end = as.Date("2001-09-28"))
## End(Not run)
## The result of the code above is equivalent to:
data(securities_returns)
nine_eleven_car_param <- car_parametric_tests(
    list_of_returns = securities_returns,
    car_start = as.Date("2001-09-11"),
    car_end = as.Date("2001-09-28")
)




