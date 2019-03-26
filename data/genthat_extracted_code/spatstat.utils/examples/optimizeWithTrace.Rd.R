library(spatstat.utils)


### Name: optimizeWithTrace
### Title: One Dimensional Optimization with Tracing
### Aliases: optimizeWithTrace
### Keywords: optimize

### ** Examples

  f <- function (x, a) (x - a)^2
  result <- optimizeWithTrace(f, c(0, 1), tol = 0.0001, a = 1/3)
  result
  curve(f(x, 1/3))
  with(result, points(x, y, pch=16))



