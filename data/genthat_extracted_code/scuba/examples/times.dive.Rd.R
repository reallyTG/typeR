library(scuba)


### Name: times.dive
### Title: Elapsed times at each waypoint of a dive
### Aliases: times.dive times.dive<-
### Keywords: utilities

### ** Examples

   d <- dive(c(30,20), c(5,5))
   d
   times.dive(d)
   # stretch time by 10 percent
   times.dive(d) <- 1.1 * times.dive(d)
   d



