library(scuba)


### Name: depths.dive
### Title: Depths at each waypoint of a dive
### Aliases: depths.dive depths.dive<-
### Keywords: utilities

### ** Examples

   d <- dive(c(30,20), c(5,5))
   d
   depths.dive(d)
   # what if we had dived to 35 metres?
   depths.dive(d)[2:3] <- 35
   d



