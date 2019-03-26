library(spatstat)


### Name: lurking
### Title: Lurking Variable Plot
### Aliases: lurking lurking.ppp lurking.ppm
### Keywords: spatial models hplot

### ** Examples

  (a <- lurking(nztrees, expression(x), type="raw"))
  fit <- ppm(nztrees ~x, Poisson(), nd=128)
  (b <- lurking(fit, expression(x), type="raw"))
  lurking(fit, expression(x), type="raw", cumulative=FALSE)



