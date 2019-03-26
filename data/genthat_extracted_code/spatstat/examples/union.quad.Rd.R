library(spatstat)


### Name: union.quad
### Title: Union of Data and Dummy Points
### Aliases: union.quad
### Keywords: spatial manip

### ** Examples

  data(simdat)
  Q <- quadscheme(simdat, default.dummy(simdat))
  U <- union.quad(Q)
  ## Not run: plot(U)
  # equivalent:
  U <- as.ppp(Q)



