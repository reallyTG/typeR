library(linbin)


### Name: crop_events
### Title: Crop Events
### Aliases: crop_events

### ** Examples

e <- events(c(0, 10, 20), c(10, 20, 30), x = 10)
crop_events(e, events(c(0, 15)))
crop_events(e, events(c(0, 5, 15)))
crop_events(e, events(c(0, 5, 15)), scaled.cols = "x")
crop_events(e, events(c(0, 5, 5, 15)), scaled.cols = "x")   # creates new points inside lines
crop_events(e, events(c(0, 10, 10, 15)), scaled.cols = "x") # but not at line event endpoints



