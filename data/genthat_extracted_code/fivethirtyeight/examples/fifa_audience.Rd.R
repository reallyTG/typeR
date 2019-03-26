library(fivethirtyeight)


### Name: fifa_audience
### Title: How To Break FIFA
### Aliases: fifa_audience
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
fifa_audience_tidy <- fifa_audience %>%
  gather(type, share, -c(country, confederation)) %>%
  mutate(type = str_sub(type, start=1, end=-7)) %>%
  arrange(country)



