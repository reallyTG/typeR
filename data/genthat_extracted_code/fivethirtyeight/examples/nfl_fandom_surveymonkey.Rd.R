library(fivethirtyeight)


### Name: nfl_fandom_surveymonkey
### Title: How Every NFL Team’s Fans Lean Politically
### Aliases: nfl_fandom_surveymonkey
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
nfl_fandom_surveymonkey_tidy <- nfl_fandom_surveymonkey %>%
  gather(key = race_party, value = percent,
         -c("team", "total_respondents", "gop_percent", "dem_percent",
            "ind_percent", "white_percent", "nonwhite_percent")) %>%
  arrange(team)



