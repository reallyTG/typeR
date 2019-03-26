library(fivethirtyeight)


### Name: love_actually_appearance
### Title: The Definitive Analysis Of 'Love Actually,' The Greatest
###   Christmas Movie Of Our Time
### Aliases: love_actually_appearance
### Keywords: datasets

### ** Examples

# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
love_actually_appearance_tidy <- love_actually_appearance %>%
  gather(actor, appears, -c(scenes)) %>%
  arrange(scenes)



