library(fivethirtyeight)


### Name: nba_carmelo
### Title: The Complete History Of The NBA 2017-18 NBA Predictions
### Aliases: nba_carmelo
### Keywords: datasets

### ** Examples

# To obtain the entire dataset, run the following code:
library(tidyverse)
library(janitor)
nba_carmelo <- read_csv("https://projects.fivethirtyeight.com/nba-model/nba_elo.csv") %>%
  clean_names() %>%
  mutate(
    team1 = as.factor(team1),
    team2 = as.factor(team2),
    playoff = ifelse(playoff == "t", TRUE, FALSE),
    playoff = ifelse(is.na(playoff), FALSE, TRUE),
    neutral = ifelse(neutral == 1, TRUE, FALSE)
  )



