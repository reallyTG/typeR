library(linbin)


### Name: is_events
### Title: Validate Event Table
### Aliases: is_events

### ** Examples

verbose <- TRUE
is_events(c(1, 3), verbose)
is_events(data.frame(from = 1, t = 3), verbose)
is_events(data.frame(from = 1, from = 1, to = 3), verbose)
is_events(data.frame(from = 1, to = TRUE), verbose)
is_events(data.frame(from = 1, to = NA), verbose)
is_events(data.frame(from = 3, to = 1), verbose)
is_events(data.frame(from = 1, to = 3), verbose)   # TRUE



