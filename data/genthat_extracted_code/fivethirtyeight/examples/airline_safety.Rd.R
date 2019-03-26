library(fivethirtyeight)


### Name: airline_safety
### Title: Should Travelers Avoid Flying Airlines That Have Had Crashes in
###   the Past?
### Aliases: airline_safety
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
airline_safety_tidy <- airline_safety %>%
  gather(type, count, -c(airline, incl_reg_subsidiaries, avail_seat_km_per_week)) %>%
  mutate(
    period = str_sub(type, start=-5),
    period = str_replace_all(period, "_", "-"),
    type = str_sub(type, end=-7)
  )



