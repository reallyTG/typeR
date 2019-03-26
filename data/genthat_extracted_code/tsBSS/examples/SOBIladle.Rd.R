library(tsBSS)


### Name: SOBIladle
### Title: Ladle Estimator to Estimate the Number of White Noise Components
###   in SOS with SOBI
### Aliases: SOBIladle
### Keywords: multivariate ts

### ** Examples

  n <- 1000
  
  s1 <- arima.sim(n = n, list(ar = 0.6, ma = c(0, -0.4)))
  s2 <- arima.sim(n = n, list(ar = c(0, 0.1,0.3), ma = c(0.2, 0.4)))
  s3 <- arima.sim(n = n, list(ar = c(0, 0.8)))
  Snoise <- matrix(rnorm(5*n), ncol = 5)
  S <- cbind(s1, s2, s3, Snoise)

  A <- matrix(rnorm(64), 8, 8)
  X <- S %*% t(A)
  
  ladle_SOBI <- SOBIladle(X, l = 20, sim = "geom")

  # The estimated number of non-white-noise components
  summary(ladle_SOBI)
  
  # The ladle plot
  ladleplot(ladle_SOBI)
  
  # Time series plots of the estimated components
  plot(ladle_SOBI)
  
  # Note that AMUSEladle with lag 1 does not work due to the lack of short range dependencies
  ladle_AMUSE <- AMUSEladle(X)

  summary(ladle_AMUSE)
  ladleplot(ladle_AMUSE)




