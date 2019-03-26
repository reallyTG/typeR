library(spatstat)


### Name: methods.fii
### Title: Methods for Fitted Interactions
### Aliases: methods.fii print.fii plot.fii coef.fii summary.fii
###   print.summary.fii coef.summary.fii
### Keywords: spatial methods

### ** Examples

  mod <- ppm(cells, ~1, Strauss(0.1))
  f <- fitin(mod)
  f
  summary(f)
  plot(f)
  coef(f)
  coef(summary(f))



