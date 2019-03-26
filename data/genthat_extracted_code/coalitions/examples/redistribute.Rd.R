library(coalitions)


### Name: redistribute
### Title: Calculate percentage of votes/seats after excluding parties with
###   'votes < hurdle'
### Aliases: redistribute

### ** Examples

library(coalitions)
library(dplyr) 
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample)
# redistribute the shares of 'others' parties and parties with a share of under 5%
surveys <- surveys %>% mutate(survey_redist = purrr::map(survey, redistribute))
surveys$survey # results before redistribution
surveys$survey_redist # results after redistribution



