library(tidyquant)


### Name: tq_get
### Title: Get quantitative data in 'tibble' format
### Aliases: tq_get tq_get_options tq_get_stock_index_options

### ** Examples

# Load libraries
library(tidyquant)

# Get the list of `get` options
tq_get_options()

# Get stock prices for a stock from Yahoo
aapl_stock_prices <- tq_get("AAPL")

# Get stock prices for multiple stocks
mult_stocks <- tq_get(c("FB", "AMZN"),
                      get  = "stock.prices",
                      from = "2016-01-01",
                      to   = "2017-01-01")

# Multiple gets
mult_gets <- tq_get("AAPL",
                    get = c("stock.prices", "dividends"),
                    from = "2016-01-01",
                    to   = "2017-01-01")



