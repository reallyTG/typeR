library(fivethirtyeight)


### Name: ratings
### Title: An Inconvenient Sequel
### Aliases: ratings
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
ratings_tidy <- ratings %>%
  gather(votes, count, -c(timestamp, respondents, category, link, average, mean, median)) %>%
  arrange(timestamp)



