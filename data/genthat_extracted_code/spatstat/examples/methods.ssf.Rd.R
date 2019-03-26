library(spatstat)


### Name: methods.ssf
### Title: Methods for Spatially Sampled Functions
### Aliases: methods.ssf marks.ssf marks<-.ssf unmark.ssf as.im.ssf
###   as.function.ssf as.ppp.ssf print.ssf summary.ssf range.ssf min.ssf
###   max.ssf integral.ssf
### Keywords: spatial methods

### ** Examples

  g <- distfun(cells[1:4])
  X <- rsyst(Window(cells), 10)
  f <- ssf(X, g(X))
  f
  summary(f)
  marks(f)
  as.ppp(f)
  as.im(f)
  integral(f)
  integral(f, quadrats(Window(f), 3))



