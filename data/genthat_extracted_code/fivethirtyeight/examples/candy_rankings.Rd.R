library(fivethirtyeight)


### Name: candy_rankings
### Title: Candy Power Ranking
### Aliases: candy_rankings
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
candy_rankings_tidy <- candy_rankings %>%
  gather(characteristics, present, -c(competitorname, sugarpercent, pricepercent, winpercent)) %>%
  mutate(present = as.logical(present)) %>%
  arrange(competitorname)



