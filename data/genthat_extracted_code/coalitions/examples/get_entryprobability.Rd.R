library(coalitions)


### Name: get_entryprobability
### Title: Get probabilities to enter the parliament.
### Aliases: get_entryprobability
### Keywords: internal

### ** Examples

library(coalitions)
library(dplyr) 
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample)
# use 100 simulations for a fast runtime
surveys <- surveys %>% mutate(draws = purrr::map(survey, draw_from_posterior, nsim = 100),
                              entryProbs = purrr::map(draws, get_entryprobability))
surveys$entryProbs



