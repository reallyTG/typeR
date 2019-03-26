library(fivethirtyeight)


### Name: mayweather_mcgregor_tweets
### Title: Mayweather Vs McGregor Tweets
### Aliases: mayweather_mcgregor_tweets
### Keywords: datasets

### ** Examples

# To obtain the entire dataset, run the code inside the following if statement:
if(FALSE){
  library(tidyverse)
  url <-
   "https://raw.githubusercontent.com/fivethirtyeight/data/master/mayweather-mcgregor/tweets.csv"
  mayweather_mcgregor_tweets <- read_csv(url) %>%
    mutate(
      emojis = as.logical(emojis),
      retweeted = as.logical(retweeted),
      id = as.character(id)
    )
}



