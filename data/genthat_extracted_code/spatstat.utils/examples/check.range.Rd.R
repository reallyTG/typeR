library(spatstat.utils)


### Name: check.range
### Title: Utilities for Ranges of Values
### Aliases: check.range check.in.range inside.range intersect.ranges
###   prange
### Keywords: programming utilities

### ** Examples

   rr <- c(0, 2)
   ss <- c(1, 3)
   x <- seq(0.5, 3.5, by=1)
   check.range(rr)
   check.range(42, fatal=FALSE)
   inside.range(x, rr)
   intersect.ranges(rr, ss)
   prange(rr)   



