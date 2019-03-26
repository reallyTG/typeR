library(spatstat.utils)


### Name: ifelseAB
### Title: Conditional Selection
### Aliases: ifelse0NA ifelse1NA ifelseAB ifelseAX ifelseXB ifelseXY
###   ifelseNegPos
### Keywords: manip utilities

### ** Examples

   x <- runif(4e5)
   u <- (x < 0.5)
   system.time(ifelse(u, 2, x))
   system.time(ifelseAX(u, 2, x))



