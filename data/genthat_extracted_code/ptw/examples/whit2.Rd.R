library(ptw)


### Name: whit2
### Title: Weighted Whittaker smoothing with a second order finite
###   difference penalty
### Aliases: whit2
### Keywords: manip

### ** Examples

  data(gaschrom)
  plot(gaschrom[1,], type = "l", ylim = c(0, 100))
  lines(whit2(gaschrom[1,], lambda = 1e5), col = 2)
  lines(whit2(gaschrom[1,], lambda = 1e6), col = 3)
  lines(whit2(gaschrom[1,], lambda = 1e7), col = 4)
  


