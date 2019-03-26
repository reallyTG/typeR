library(tidyquant)


### Name: geom_chart
### Title: Plot Financial Charts in ggplot2
### Aliases: geom_chart geom_barchart geom_candlestick

### ** Examples

# Load libraries
library(tidyquant)

AAPL <- tq_get("AAPL")

# Bar Chart
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_barchart(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(color = "darkgreen") +
    coord_x_date(xlim = c(today() - weeks(6), today()),
                 ylim = c(100, 130))

# Candlestick Chart
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(color = "darkgreen") +
    coord_x_date(xlim = c(today() - weeks(6), today()),
                 ylim = c(100, 130))



