library(TwoRegression)


### Name: get_directions
### Title: Calculate direction changes per five seconds in sliding windows
### Aliases: get_directions

### ** Examples

## Not run: 
##D ##All possible directions
##D directions <-
##D   c("N", "NNE", "NE", "ENE",
##D     "E", "ESE", "SE", "SSE",
##D     "S", "SSW", "SW", "WSW",
##D     "W", "WNW", "NW", "NNW")
##D 
##D ##Reproducible results
##D set.seed(55)
##D direction_vector <- sample(directions, 50, replace = TRUE)
##D 
##D ##Vector of direction changes per 5-s. First and last two values are always NA
##D get_directions(direction_vector)
## End(Not run)




