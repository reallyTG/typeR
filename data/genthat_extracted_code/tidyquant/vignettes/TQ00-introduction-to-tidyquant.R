## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(message = FALSE,
                      warning = FALSE,
                      fig.width = 8, 
                      fig.height = 4.5,
                      fig.align = 'center',
                      out.width='95%', 
                      dpi = 200)
library(tidyquant)
# devtools::load_all() # Travis CI fails on load_all()

## ---- echo = F-----------------------------------------------------------
library(tidyquant)
data("FANG")
end <- as_date("2017-01-01")
start <- end - weeks(24)
FANG %>%
    filter(date >= start - days(2 * 20)) %>%
    ggplot(aes(x = date, y = close, 
               open = open, high = high, low = low, close = close, 
               group = symbol)) +
    geom_barchart() +
    geom_bbands(ma_fun = SMA, sd = 2, n = 20, linetype = 5) +
    labs(title = "FANG Bar Chart", 
         subtitle = "BBands with SMA Applied, Multiple Stocks", 
         y = "Closing Price", x = "") + 
    coord_x_date(xlim = c(start, end)) +
    facet_wrap(~ symbol, ncol = 2, scales = "free_y") +
    theme_tq()

