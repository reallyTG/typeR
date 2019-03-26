library(ptw)


### Name: difsm
### Title: Smoothing with a finite difference penalty
### Aliases: difsm
### Keywords: manip

### ** Examples

  data(gaschrom)
  plot(gaschrom[1,], type = "l", ylim = c(0, 100))
  lines(difsm(gaschrom[1,], lambda = 1e5), col = 2)
  lines(difsm(gaschrom[1,], lambda = 1e6), col = 3)
  lines(difsm(gaschrom[1,], lambda = 1e7), col = 4)
  


