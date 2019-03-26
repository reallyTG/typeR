library(tidytext)


### Name: parts_of_speech
### Title: Parts of speech for English words from the Moby Project
### Aliases: parts_of_speech
### Keywords: datasets

### ** Examples


library(dplyr)

parts_of_speech

parts_of_speech %>%
  count(pos, sort = TRUE)




