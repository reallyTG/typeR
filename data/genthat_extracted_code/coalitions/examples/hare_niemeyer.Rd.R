library(coalitions)


### Name: hare_niemeyer
### Title: Seat Distribution by Hare/Niemeyer
### Aliases: hare_niemeyer

### ** Examples

library(coalitions)
library(dplyr)
# get the latest survey for the sample German federal election polls
surveys <- get_latest(surveys_sample) %>% tidyr::unnest()
# calculate the seat distribution based on Hare/Niemeyer for a parliament with 300 seats
hare_niemeyer(surveys$votes, surveys$party, n_seats = 300)



