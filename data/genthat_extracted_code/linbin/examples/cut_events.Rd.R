library(linbin)


### Name: cut_events
### Title: Cut Events
### Aliases: cut_events

### ** Examples

e <- events(c(0, 10, 20), c(10, 20, 30), x = 10)
cut_events(e, events(c(0, 5, 15)))
cut_events(e, events(c(0, 5, 15)), scaled.cols = "x")
cut_events(e, events(c(0, 5, 5, 15)), scaled.cols = "x")   # creates new points inside lines
cut_events(e, events(c(0, 10, 10, 15)), scaled.cols = "x") # but not at line event endpoints



