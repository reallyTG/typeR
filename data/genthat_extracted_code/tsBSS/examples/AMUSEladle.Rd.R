library(tsBSS)


### Name: AMUSEladle
### Title: Ladle Estimator to Estimate the Number of White Noise Components
###   in SOS with AMUSE
### Aliases: AMUSEladle
### Keywords: multivariate ts

### ** Examples

  n <- 1000
  
  s1 <- arima.sim(n = n, list(ar = 0.6, ma = c(0, -0.4)))
  s2 <- arima.sim(n = n, list(ar = c(0.4,0.1,0.3), ma = c(0.2, 0.4)))
  s3 <- arima.sim(n = n, list(ar = c(0.7, 0.1)))
  Snoise <- matrix(rnorm(5*n), ncol = 5)
  S <- cbind(s1, s2, s3, Snoise)

  A <- matrix(rnorm(64), 8, 8)
  X <- S %*% t(A)
  
  ladle_AMUSE <- AMUSEladle(X, l = 20, sim = "geom")

  # The estimated number on non-white-noise components
  summary(ladle_AMUSE)
  
  # The ladle plot
  ladleplot(ladle_AMUSE)
  # Using ggplot
  ggladleplot(ladle_AMUSE)
  
  # Time series plots of the estimated components
  plot(ladle_AMUSE)
  



