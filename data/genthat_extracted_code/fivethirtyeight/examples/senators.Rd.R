library(fivethirtyeight)


### Name: senators
### Title: Senator Dataset
### Aliases: senators
### Keywords: datasets

### ** Examples

# To obtain the entire dataset, run the code inside the following if statement:
if(FALSE){
  library(tidyverse)
  url <- "https://raw.githubusercontent.com/fivethirtyeight/data/master/twitter-ratio/senators.csv"
  senators <- read_csv(url) %>%
    mutate(
      party = as.factor(party),
      state = as.factor(state),
      created_at = as.POSIXct(created_at, tz = "GMT", format = "%m/%d/%Y %H:%M"),
      text =  gsub("[^\x01-\x7F]", "", text)
    ) %>%
    select(created_at, user, everything())
}



