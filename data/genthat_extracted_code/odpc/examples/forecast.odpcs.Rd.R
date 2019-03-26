library(odpc)


### Name: forecast.odpcs
### Title: Get Forecast From an odpcs Object
### Aliases: forecast.odpcs
### Keywords: ts

### ** Examples

  T <- 201 #length of series
  m <- 10 #number of series
  set.seed(1234)
  f <- matrix(0, 2 * T + 1, 1)
  v <- rnorm(2 * T + 1)
  f[1] <- rnorm(1)
  theta <- 0.7
  for (t in  2:(2 * T)){
    f[t] <- theta * f[t - 1] + v[t]
  }
  f <- f[T:(2 * T)]
  x <- matrix(0, T, m)
  u <- matrix(rnorm(T * m), T, m)
  for (i in 1:m) {
    x[, i] <- sin(2 * pi * (i/m)) * f[1:T] + cos(2 * pi * (i/m)) * f[2:(T + 1)] + u[, i]
  }
  fit <- odpc(x[1:(T - 1), ], ks = c(1))
  forecasts <- forecast.odpcs(fit, h = 1)
  mse <- mean((x[T, ] - forecasts)**2)
  mse



