library(linbin)


### Name: event_coverage
### Title: Event Coverage
### Aliases: event_coverage

### ** Examples

e <- events(c(1, 2, 4, 8), c(3, 4, 5, 10))
event_coverage(e, closed = TRUE)  # retains breaks
event_coverage(e, closed = FALSE) # drops breaks
e <- events(c(0, 2, 2, 2, 8, 10), c(0, 2, 2, 6, 10, 10))
event_coverage(e, closed = TRUE)  # retains isolated points
event_coverage(e, closed = FALSE) # retains isolated points and points adjacent to lines



