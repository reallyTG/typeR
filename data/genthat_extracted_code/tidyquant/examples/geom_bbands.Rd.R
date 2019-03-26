library(tidyquant)


### Name: geom_bbands
### Title: Plot Bollinger Bands using Moving Averages
### Aliases: geom_bbands geom_bbands_

### ** Examples

# Load libraries
library(tidyquant)

AAPL <- tq_get("AAPL")

# SMA
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_line() +           # Plot stock price
    geom_bbands(aes(high = high, low = low, close = close), ma_fun = SMA, n = 50) +
    coord_x_date(xlim = c(today() - years(1), today()), ylim = c(80, 130))


# EMA
AAPL %>%
   ggplot(aes(x = date, y = close)) +
   geom_line() +           # Plot stock price
   geom_bbands(aes(high = high, low = low, close = close),
                  ma_fun = EMA, wilder = TRUE, ratio = NULL, n = 50) +
   coord_x_date(xlim = c(today() - years(1), today()), ylim = c(80, 130))


# VWMA
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_line() +           # Plot stock price
    geom_bbands(aes(high = high, low = low, close = close, volume = volume),
                   ma_fun = VWMA, n = 50) +
    coord_x_date(xlim = c(today() - years(1), today()), ylim = c(80, 130))



