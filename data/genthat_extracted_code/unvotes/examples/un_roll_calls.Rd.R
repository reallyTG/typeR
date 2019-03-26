library(unvotes)


### Name: un_roll_calls
### Title: Data on each roll call of the United Nations General Assembly
### Aliases: un_roll_calls
### Keywords: datasets

### ** Examples


library(dplyr)

# combine with per-country-vote information
un_votes %>%
  inner_join(un_roll_calls, by = "rcid")




