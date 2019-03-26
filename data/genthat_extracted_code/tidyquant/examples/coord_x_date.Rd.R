library(tidyquant)


### Name: coord_x_date
### Title: Zoom in on plot regions using date ranges or date-time ranges
### Aliases: coord_x_date coord_x_datetime

### ** Examples

# Load libraries
library(tidyquant)

# coord_x_date
AAPL <- tq_get("AAPL")
AAPL %>%
    ggplot(aes(x = date, y = adjusted)) +
    geom_line() +                         # Plot stock price
    geom_ma(n = 50) +                 # Plot 50-day Moving Average
    geom_ma(n = 200, color = "red") + # Plot 200-day Moving Average
    coord_x_date(xlim = c(today() - weeks(12), today()),
               ylim = c(100, 130))        # Zoom in


# coord_x_datetime
time_index <- seq(from = as.POSIXct("2012-05-15 07:00"),
                  to = as.POSIXct("2012-05-17 18:00"),
                  by = "hour")
set.seed(1)
value <- rnorm(n = length(time_index))
hourly_data <- tibble(time.index = time_index,
                      value = value)
hourly_data %>%
    ggplot(aes(x = time.index, y = value)) +
    geom_point() +
    coord_x_datetime(xlim = c("2012-05-15 07:00:00", "2012-05-15 16:00:00"))



