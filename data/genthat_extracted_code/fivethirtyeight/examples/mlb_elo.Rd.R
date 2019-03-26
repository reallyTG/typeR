library(fivethirtyeight)


### Name: mlb_elo
### Title: MLB Elo
### Aliases: mlb_elo
### Keywords: datasets

### ** Examples

# To obtain the entire dataset, run the code inside the following if statement:
if(FALSE){
  library(tidyverse)
  mlb_elo <- read_csv("https://projects.fivethirtyeight.com/mlb-api/mlb_elo.csv") %>%
    mutate(
      playoff = as.factor(playoff),
      playoff = ifelse(playoff == "<NA>", NA, playoff),
      neutral = as.logical(neutral)
    )
}



