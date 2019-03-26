library(tidyquant)


### Name: tq_mutate
### Title: Mutates quantitative data
### Aliases: tq_mutate tq_mutate tq_mutate_ tq_mutate_xy tq_mutate_xy_
###   tq_mutate_fun_options tq_transmute tq_transmute_ tq_transmute_xy
###   tq_transmute_xy_ tq_transmute_fun_options

### ** Examples

# Load libraries
library(tidyquant)

##### Basic Functionality

fb_stock_prices  <- tq_get("FB",
                           get  = "stock.prices",
                           from = "2016-01-01",
                           to   = "2016-12-31")

# Example 1: Return logarithmic daily returns using periodReturn()
fb_stock_prices %>%
    tq_mutate(select = close, mutate_fun = periodReturn,
              period = "daily", type = "log")

# Example 2: Use tq_mutate_xy to use functions with two columns required
fb_stock_prices %>%
    tq_mutate_xy(x = close, y = volume, mutate_fun = EVWMA,
                 col_rename = "EVWMA")

# Example 3: Using tq_mutate to work with non-OHLC data
tq_get("DCOILWTICO", get = "economic.data") %>%
    tq_mutate(select = price, mutate_fun = lag.xts, k = 1, na.pad = TRUE)

# Example 4: Using tq_mutate to apply a rolling regression
fb_returns <- fb_stock_prices %>%
    tq_transmute(adjusted, periodReturn, period = "monthly", col_rename = "fb.returns")
xlk_returns <- tq_get("XLK", from = "2016-01-01", to = "2016-12-31") %>%
    tq_transmute(adjusted, periodReturn, period = "monthly", col_rename = "xlk.returns")
returns_combined <- left_join(fb_returns, xlk_returns, by = "date")
regr_fun <- function(data) {
    coef(lm(fb.returns ~ xlk.returns, data = as_data_frame(data)))
}
returns_combined %>%
    tq_mutate(mutate_fun = rollapply,
              width      = 6,
              FUN        = regr_fun,
              by.column  = FALSE,
              col_rename = c("coef.0", "coef.1"))

# Example 5: Non-standard evaluation:
# Programming with tq_mutate_() and tq_mutate_xy_()
col_name <- "adjusted"
mutate <- c("MACD", "SMA")
tq_mutate_xy_(fb_stock_prices, x = col_name, mutate_fun = mutate[[1]])



