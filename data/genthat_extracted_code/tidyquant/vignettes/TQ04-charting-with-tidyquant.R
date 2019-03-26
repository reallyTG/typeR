## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.width = 8, 
                      fig.height = 4.5,
                      fig.align = 'center',
                      out.width='95%')
# devtools::load_all() # Travis CI fails on load_all()

## ------------------------------------------------------------------------
# Loads tidyquant, tidyverse, lubridate, xts, quantmod, TTR 
library(tidyquant)  

## ------------------------------------------------------------------------
# Use FANG data set
data("FANG") 

# Get AAPL and AMZN Stock Prices
AAPL <- tq_get("AAPL", get = "stock.prices", from = "2015-09-01", to = "2016-12-31")
AMZN <- tq_get("AMZN", get = "stock.prices", from = "2000-01-01", to = "2016-12-31")

## ------------------------------------------------------------------------
end <- as_date("2016-12-31")

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_line() +
    labs(title = "AAPL Line Chart", y = "Closing Price", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_barchart(aes(open = open, high = high, low = low, close = close)) +
    labs(title = "AAPL Bar Chart", y = "Closing Price", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_barchart(aes(open = open, high = high, low = low, close = close)) +
    labs(title = "AAPL Bar Chart", 
         subtitle = "Zoomed in using coord_x_date",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(6), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_barchart(aes(open = open, high = high, low = low, close = close),
                     color_up = "darkgreen", color_down = "darkred", size = 1) +
    labs(title = "AAPL Bar Chart", 
         subtitle = "Zoomed in, Experimenting with Formatting",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(6), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    labs(title = "AAPL Candlestick Chart", y = "Closing Price", x = "") +
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    labs(title = "AAPL Candlestick Chart", 
         subtitle = "Zoomed in using coord_x_date",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(6), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close),
                        color_up = "darkgreen", color_down = "darkred", 
                        fill_up  = "darkgreen", fill_down  = "darkred") +
    labs(title = "AAPL Candlestick Chart", 
         subtitle = "Zoomed in, Experimenting with Formatting",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(6), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ---- fig.height=5-------------------------------------------------------
start <- end - weeks(6)
FANG %>%
    filter(date >= start - days(2 * 15)) %>%
    ggplot(aes(x = date, y = close, group = symbol)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    labs(title = "FANG Candlestick Chart", 
         subtitle = "Experimenting with Mulitple Stocks",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, ncol = 2, scale = "free_y") + 
    theme_tq()

## ---- fig.height=5-------------------------------------------------------
start <- end - weeks(6)
FANG %>%
    filter(date >= start - days(2 * 15)) %>%
    ggplot(aes(x = date, y = close, group = symbol)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(ma_fun = SMA, n = 15, color = "darkblue", size = 1) +
    labs(title = "FANG Candlestick Chart", 
         subtitle = "Experimenting with Mulitple Stocks",
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, ncol = 2, scale = "free_y") +
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(ma_fun = SMA, n = 50, linetype = 5, size = 1.25) +
    geom_ma(ma_fun = SMA, n = 200, color = "red", size = 1.25) + 
    labs(title = "AAPL Candlestick Chart", 
         subtitle = "50 and 200-Day SMA", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(24), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close)) +
    geom_barchart(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(ma_fun = EMA, n = 50, wilder = TRUE, linetype = 5, size = 1.25) +
    geom_ma(ma_fun = EMA, n = 200, wilder = TRUE, color = "red", size = 1.25) + 
    labs(title = "AAPL Bar Chart", 
         subtitle = "50 and 200-Day EMA", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(24), end),
                 ylim = c(100, 120)) +
    theme_tq()

## ---- fig.height=5-------------------------------------------------------
start <- end - weeks(6)
FANG %>%
    filter(date >= start - days(2 * 50)) %>%
    ggplot(aes(x = date, y = close, volume = volume, group = symbol)) +
    geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
    geom_ma(ma_fun = VWMA, n = 15, wilder = TRUE, linetype = 5) +
    geom_ma(ma_fun = VWMA, n = 50, wilder = TRUE, color = "red") + 
    labs(title = "FANG Bar Chart", 
         subtitle = "50 and 200-Day EMA, Experimenting with Multiple Stocks", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, ncol = 2, scales = "free_y") + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close, open = open,
               high = high, low = low, close = close)) +
    geom_candlestick() +
    geom_bbands(ma_fun = SMA, sd = 2, n = 20) +
    labs(title = "AAPL Candlestick Chart", 
         subtitle = "BBands with SMA Applied", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(24), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ------------------------------------------------------------------------
AAPL %>%
    ggplot(aes(x = date, y = close, open = open,
               high = high, low = low, close = close)) +
    geom_candlestick() +
    geom_bbands(ma_fun = SMA, sd = 2, n = 20, 
                linetype = 4, size = 1, alpha = 0.2, 
                fill        = palette_light()[[1]], 
                color_bands = palette_light()[[1]], 
                color_ma    = palette_light()[[2]]) +
    labs(title = "AAPL Candlestick Chart", 
         subtitle = "BBands with SMA Applied, Experimenting with Formatting", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(end - weeks(24), end),
                 ylim = c(100, 120)) + 
    theme_tq()

## ---- fig.height=5-------------------------------------------------------
start <- end - weeks(24)
FANG %>%
    filter(date >= start - days(2 * 20)) %>%
    ggplot(aes(x = date, y = close, 
               open = open, high = high, low = low, close = close, 
               group = symbol)) +
    geom_barchart() +
    geom_bbands(ma_fun = SMA, sd = 2, n = 20, linetype = 5) +
    labs(title = "FANG Bar Chart", 
         subtitle = "BBands with SMA Applied, Experimenting with Multiple Stocks", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, ncol = 2, scales = "free_y") + 
    theme_tq()

## ------------------------------------------------------------------------
AMZN %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line(color = palette_light()[[1]]) + 
    scale_y_continuous() +
    labs(title = "AMZN Line Chart", 
         subtitle = "Continuous Scale", 
         y = "Closing Price", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
AMZN %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line(color = palette_light()[[1]]) + 
    scale_y_log10() +
    labs(title = "AMZN Line Chart", 
         subtitle = "Log Scale", 
         y = "Closing Price", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
AMZN %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line(color = palette_light()[[1]]) + 
    scale_y_log10() +
    geom_smooth(method = "lm") +
    labs(title = "AMZN Line Chart", 
         subtitle = "Log Scale, Applying Linear Trendline", 
         y = "Adjusted Closing Price", x = "") + 
    theme_tq()

## ------------------------------------------------------------------------
AMZN %>%
    ggplot(aes(x = date, y = volume)) +
    geom_segment(aes(xend = date, yend = 0, color = volume)) + 
    geom_smooth(method = "loess", se = FALSE) +
    labs(title = "AMZN Volume Chart", 
         subtitle = "Charting Daily Volume", 
         y = "Volume", x = "") +
    theme_tq() +
    theme(legend.position = "none") 

## ------------------------------------------------------------------------
start <- end - weeks(24)
AMZN %>%
    filter(date >= start - days(50)) %>%
    ggplot(aes(x = date, y = volume)) +
    geom_segment(aes(xend = date, yend = 0, color = volume)) +
    geom_smooth(method = "loess", se = FALSE) +
    labs(title = "AMZN Bar Chart", 
         subtitle = "Charting Daily Volume, Zooming In", 
         y = "Volume", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    scale_color_gradient(low = "red", high = "darkblue") +
    theme_tq() + 
    theme(legend.position = "none") 

## ---- fig.height = 6-----------------------------------------------------
n_mavg <- 50 # Number of periods (days) for moving average
FANG %>%
    filter(date >= start - days(2 * n_mavg)) %>%
    ggplot(aes(x = date, y = close, color = symbol)) +
    geom_line(size = 1) +
    geom_ma(n = 15, color = "darkblue", size = 1) + 
    geom_ma(n = n_mavg, color = "red", size = 1) +
    labs(title = "Dark Theme",
         x = "", y = "Closing Price") +
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, scales = "free_y") +
    theme_tq_dark() +
    scale_color_tq(theme = "dark") +
    scale_y_continuous(labels = scales::dollar)

