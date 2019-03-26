library(fivethirtyeight)


### Name: ahca_polls
### Title: American Health Care Act Polls
### Aliases: ahca_polls
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
ahca_polls_tidy <- ahca_polls %>%
  gather(opinion, count, -c(start, end, pollster, text, url))



