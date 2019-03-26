library(coalitions)


### Name: have_majority
### Title: Do coalitions have a majority
### Aliases: have_majority

### ** Examples

library(coalitions)
library(dplyr) 
library(purrr)
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample)
# check for majorities of two coalitions
coals <- list(c("cdu", "fdp"),
              c("spd", "left", "greens"))
# only use 100 simulations for a fast runtime
surveys <- surveys %>% mutate(draws = map(survey, draw_from_posterior, nsim = 100),
                              seats = map2(draws, survey, get_seats),
                              majorities = map(seats, have_majority, coalitions = coals))
surveys$majorities



