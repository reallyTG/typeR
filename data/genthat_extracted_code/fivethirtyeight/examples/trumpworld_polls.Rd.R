library(fivethirtyeight)


### Name: trumpworld_polls
### Title: What the World Thinks of Trump
### Aliases: trumpworld_polls
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
trumpworld_polls_tidy <- trumpworld_polls %>%
  gather(country, percent_positive, -c("year", "avg", "question"))



