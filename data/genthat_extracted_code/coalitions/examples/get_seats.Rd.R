library(coalitions)


### Name: get_seats
### Title: Calculate seat distribution from draws from posterior
### Aliases: get_seats
### Keywords: distribution seat

### ** Examples

library(coalitions)
library(dplyr) 
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample)
# simulate 100 seat distributions
surveys <- surveys %>% mutate(draws = purrr::map(survey, draw_from_posterior, nsim = 100),
                              seats = purrr::map2(draws, survey, get_seats))
surveys$seats



