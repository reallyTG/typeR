library(fivethirtyeight)


### Name: drinks
### Title: Dear Mona Followup: Where Do People Drink The Most Beer, Wine
###   And Spirits?
### Aliases: drinks
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
drinks_tidy <- drinks %>%
  gather(type, servings, -c(country, total_litres_of_pure_alcohol)) %>%
  mutate(
    type = str_sub(type, start=1, end=-10)
  ) %>%
  arrange(country, type)



