library(ptw)


### Name: whit1
### Title: Weighted Whittaker smoothing with a first order finite
###   difference penalty
### Aliases: whit1
### Keywords: manip

### ** Examples

  data(gaschrom)
  plot(gaschrom[1,], type = "l", ylim = c(0, 100))
  lines(whit1(gaschrom[1,], lambda = 1e1), col = 2)
  lines(whit1(gaschrom[1,], lambda = 1e2), col = 3)
  lines(whit1(gaschrom[1,], lambda = 1e3), col = 4)
  


