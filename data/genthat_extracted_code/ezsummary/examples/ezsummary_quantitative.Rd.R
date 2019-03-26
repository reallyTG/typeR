library(ezsummary)


### Name: ezsummary_quantitative
### Title: Easily summarize quantitative data
### Aliases: ezsummary_q ezsummary_quantitative

### ** Examples

library(dplyr)
mtcars %>%
  group_by(am) %>%
  select(mpg, wt, qsec) %>%
  ezsummary_quantitative()




