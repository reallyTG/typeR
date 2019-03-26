library(tidyquant)


### Name: theme_tq
### Title: tidyquant themes for ggplot2.
### Aliases: theme_tq theme_tq theme_tq_dark theme_tq_green

### ** Examples

# Load libraries
library(tidyquant)

# Get stock prices
AAPL <- tq_get("AAPL")

# Plot using ggplot with theme_tq
AAPL %>% ggplot(aes(x = date, y = close)) +
       geom_line() +
       geom_bbands(aes(high = high, low = low, close = close),
                   ma_fun = EMA,
                   wilder = TRUE,
                   ratio = NULL,
                   n = 50) +
       coord_x_date(xlim = c(today() - years(1), today()),
                    ylim = c(80, 130)) +
       labs(title = "Apple BBands",
            x = "Date",
            y = "Price") +
       theme_tq()




