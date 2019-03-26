library(linbin)


### Name: group_nonoverlapping_events
### Title: Overlapping Events
### Aliases: group_nonoverlapping_events has_overlapping_events
### Keywords: internal

### ** Examples

e <- events(c(0, 2, 3), c(3, 4, 5))
cbind(group = group_nonoverlapping_events(e), e)  # adjacent lines do not overlap
e <- events(c(0, 0, 0, 1, 1), c(0, 0, 1, 1, 2))    
cbind(group = group_nonoverlapping_events(e), e)  # equal points do overlap
has_overlapping_events(events(c(0, 2), c(2, 4)))  # adjacent lines
has_overlapping_events(events(c(0, 2), c(3, 4)))  # has overlapping lines
has_overlapping_events(events(c(0, 5, 5, 10)))    # points adjcent to lines
has_overlapping_events(events(c(0, 5, 5, 5, 10))) # has overlapping points



