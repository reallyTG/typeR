library(coalitions)


### Name: get_probabilities
### Title: Wrapper for calculation of coalition probabilities from survey
### Aliases: get_probabilities

### ** Examples

library(coalitions)
library(dplyr)
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample)
# calculate probabilities for two coalitions
probs <- get_probabilities(surveys,
                           coalitions = list(c("cdu", "fdp"),
                                             c("spd", "left", "greens")),
                           nsim = 100) # ensure fast runtime with only 100 simulations
probs %>% tidyr::unnest()



