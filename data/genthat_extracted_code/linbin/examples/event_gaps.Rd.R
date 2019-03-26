library(linbin)


### Name: event_gaps
### Title: Event Gaps
### Aliases: event_gaps

### ** Examples

event_gaps(events(c(1, 3, 5), c(2, 4, 5)))    # gaps between events
event_gaps(events(1:5))                       # no gaps
event_gaps(events(1:5), closed = FALSE)       # gaps at breaks
event_gaps(events(1:5), range = events(0, 6)) # gaps to edge of range  



