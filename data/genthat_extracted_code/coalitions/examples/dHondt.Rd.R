library(coalitions)


### Name: dHondt
### Title: Seat Distribution by D'Hondt
### Aliases: dHondt

### ** Examples

library(coalitions)
library(dplyr) 
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample) %>% tidyr::unnest()
# calculate the seat distribution based on D'Hondt for a parliament with 300 seats
dHondt(surveys$votes, surveys$party, n_seats = 300)



