library(scuba)


### Name: durations.dive
### Title: Durations of time between each waypoint of a dive
### Aliases: durations.dive durations.dive<-
### Keywords: utilities

### ** Examples

   d <- dive(c(30,20), c(5,5))
   d
   durations.dive(d)
   # what if we stayed at the bottom for 25 minutes instead of 20?
   durations.dive(d)[2] <- 25
   d



