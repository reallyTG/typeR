library(spatstat)


### Name: as.function.owin
### Title: Convert Window to Indicator Function
### Aliases: as.function.owin
### Keywords: spatial manip

### ** Examples

  W <- Window(humberside)
  f <- as.function(W)
  f
  f(5000, 4500)
  f(123456, 78910)
  X <- runifpoint(5, Frame(humberside))
  f(X)
  plot(f)



