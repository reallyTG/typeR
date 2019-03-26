library(loglognorm)


### Name: dloglognorm
### Title: The Double Log Normal Distribution
### Aliases: dloglognorm ploglognorm qloglognorm rloglognorm mloglognorm
###   eloglognorm vloglognorm
### Keywords: distribution

### ** Examples

  x <- seq(0, 1, by=0.05)
  ## Several different shapes of the density:
  par(mfrow=c(3, 1))
  curve(dloglognorm(x, -0.2, 0.2), 0, 1, main="DLN(-0.2, 0.2)")
  curve(dloglognorm(x,  0.2, 1.0), 0, 1, main="DLN(0.2, 2.0)")
  curve(dloglognorm(x,  0.2, 1.8), 0, 1, main="DLN(0.2, 2.0)")

  ## Check precision:
  z <- x - pnorm(qnorm(x, .2, 1.0), .2, 1.0)
  max(z)



