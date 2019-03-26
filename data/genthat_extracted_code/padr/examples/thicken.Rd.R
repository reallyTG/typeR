library(padr)


### Name: thicken
### Title: Add a variable of a higher interval to a data frame
### Aliases: thicken

### ** Examples

x_hour <- seq(lubridate::ymd_hms('20160302 000000'), by = 'hour',
              length.out = 200)
some_df <- data.frame(x_hour = x_hour)
thicken(some_df, 'week')
thicken(some_df, 'month')
thicken(some_df, 'day', start_val = lubridate::ymd_hms('20160301 120000'))

library(dplyr)
x_df <- data.frame(
  x = seq(lubridate::ymd(20130101), by = 'day', length.out = 1000) %>%
    sample(500),
  y = runif(500, 10, 50) %>% round) %>%
  arrange(x)

# get the max per month
x_df %>% thicken('month') %>% group_by(x_month) %>%
  summarise(y_max = max(y))

# get the average per week, but you want your week to start on Mondays
# instead of Sundays
x_df %>% thicken('week',
                 start_val = closest_weekday(x_df$x, 2)) %>%
  group_by(x_week) %>% summarise(y_avg = mean(y))



