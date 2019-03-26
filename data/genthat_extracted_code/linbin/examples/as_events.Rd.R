library(linbin)


### Name: as_events
### Title: Coerce to an Event Table
### Aliases: as_events as_events.numeric as_events.matrix
###   as_events.data.frame

### ** Examples

as_events(1)
as_events(1:5)
as_events(cbind(1:5, 1:5), 1, 2)
as_events(data.frame(x = 1, start = 1:5, stop = 1:5), "start", "stop")



