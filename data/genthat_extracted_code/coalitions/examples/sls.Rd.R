library(coalitions)


### Name: sls
### Title: Seat Distribution by Sainte-Lague/Schepers
### Aliases: sls

### ** Examples

library(coalitions)
library(dplyr) 
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample) %>% tidyr::unnest()
# calculate the seat distribution based on Sainte-Lague/Schepers for a parliament with 300 seats
sls(surveys$votes, surveys$party, n_seats = 300)



