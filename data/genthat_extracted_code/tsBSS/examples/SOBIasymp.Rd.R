library(tsBSS)


### Name: SOBIasymp
### Title: Second-order Separation Sub-White-Noise Asymptotic Testing with
###   SOBI
### Aliases: SOBIasymp
### Keywords: htest multivariate ts

### ** Examples

  n <- 1000

  A <- matrix(rnorm(16), 4, 4)
  s1 <- arima.sim(list(ar = c(0, 0.6)), n)
  s2 <- arima.sim(list(ma = c(0, -0.5)), n)
  s3 <- rnorm(n)
  s4 <- rnorm(n)

  S <- cbind(s1, s2, s3, s4)
  X <- S %*% t(A)

  asymp_res_1 <- SOBIasymp(X, k = 1)
  asymp_res_1

  asymp_res_2 <- SOBIasymp(X, k = 2)
  asymp_res_2

  # Plots of the estimated sources, the last two are white noise
  plot(asymp_res_2$S)
  
  # Note that AMUSEasymp with lag 1 does not work due to the lack of short range dependencies
  AMUSEasymp(X, k = 1)




