library(tidyquant)


### Name: scale_manual
### Title: tidyquant colors and fills for ggplot2.
### Aliases: scale_manual scale_color_tq scale_colour_tq scale_fill_tq

### ** Examples

# Load libraries
library(tidyquant)

# Get stock prices
stocks <- c("AAPL", "FB", "NFLX") %>%
    tq_get(from = "2013-01-01",
           to   = "2017-01-01")

# Plot for stocks
a <- stocks %>%
    ggplot(aes(date, adjusted, color = symbol)) +
    geom_line() +
    labs(title = "Multi stock example",
         xlab = "Date",
         ylab = "Adjusted Close")

# Plot with tidyquant theme and colors
a +
    theme_tq() +
    scale_color_tq()





