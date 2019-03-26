library(railtrails)


### Name: railtrails
### Title: Rail-trail trail data
### Aliases: railtrails
### Keywords: datasets

### ** Examples

railtrails

# to expand vector of review ratings in raw_reviews column:
library(tidyr)
railtrails <- railtrails %>% unnest(raw_reviews)



