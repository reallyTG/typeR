library(spatstat)


### Name: lut
### Title: Lookup Tables
### Aliases: lut
### Keywords: spatial manip

### ** Examples

  # lookup table for real numbers, using breakpoints
  cr <- lut(factor(c("low", "medium", "high")), breaks=c(0,5,10,15))
  cr
  cr(3.2)
  cr(c(3,5,7))
  # lookup table for discrete set of values
  ct <- lut(c(0,1), inputs=c(FALSE, TRUE))
  ct(TRUE)



