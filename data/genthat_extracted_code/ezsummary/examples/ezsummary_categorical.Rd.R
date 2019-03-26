library(ezsummary)


### Name: ezsummary_categorical
### Title: Easily summarize categorical data
### Aliases: ezsummary_c ezsummary_categorical

### ** Examples

library(dplyr)
mtcars %>%
  group_by(am) %>%
  select(cyl, gear, carb) %>%
  ezsummary_categorical()

mtcars %>%
  select(cyl, gear, carb) %>%
  ezsummary_categorical(n=TRUE, round.N = 2)




