library(tidyquant)


### Name: geom_ma
### Title: Plot moving averages
### Aliases: geom_ma geom_ma_

### ** Examples

# Load libraries
library(tidyquant)

AAPL <- tq_get("AAPL")

# SMA
AAPL %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line() +                         # Plot stock price
    geom_ma(ma_fun = SMA, n = 50) +                 # Plot 50-day SMA
    geom_ma(ma_fun = SMA, n = 200, color = "red") + # Plot 200-day SMA
    coord_x_date(xlim = c(today() - weeks(12), today()),
               ylim = c(100, 130))                     # Zoom in

# EVWMA
AAPL %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line() +                                                   # Plot stock price
    geom_ma(aes(volume = volume), ma_fun = EVWMA, n = 50) +   # Plot 50-day EVWMA
    coord_x_date(xlim = c(today() - weeks(12), today()),
               ylim = c(100, 130))                                  # Zoom in



