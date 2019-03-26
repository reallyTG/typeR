library(fivethirtyeight)


### Name: bob_ross
### Title: A Statistical Analysis of the Work of Bob Ross
### Aliases: bob_ross
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
bob_ross_tidy <- bob_ross %>%
  gather(object, present, -c(episode, season, episode_num, title)) %>%
  mutate(present = as.logical(present)) %>%
  arrange(episode, object)



