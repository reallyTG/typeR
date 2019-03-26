library(fivethirtyeight)


### Name: nfl_fandom_google
### Title: How Every NFL Team’s Fans Lean Politically
### Aliases: nfl_fandom_google
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
nfl_fandom_google_tidy <- nfl_fandom_google %>%
  gather(sport, search_traffic, -c("dma", "trump_2016_vote")) %>%
  arrange(dma)



