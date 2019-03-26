library(linbin)


### Name: find_intersecting_events
### Title: Find Intersecting Events
### Aliases: find_intersecting_events

### ** Examples

ex <- events(c(0, 5, 5, 10))
find_intersecting_events(ex, events(5), equal.points = FALSE) # equal points don't intersect
find_intersecting_events(ex, events(5), equal.points = TRUE)  # equal points do intersect
find_intersecting_events(ex, events(5), closed = TRUE)        # adjacent events intersect
find_intersecting_events(ex, ex)



