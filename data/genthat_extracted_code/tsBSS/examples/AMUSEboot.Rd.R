library(tsBSS)


### Name: AMUSEboot
### Title: Second-order Separation Sub-White-Noise Bootstrap Testing with
###   AMUSE
### Aliases: AMUSEboot
### Keywords: htest multivariate ts

### ** Examples

  n <- 1000

  A <- matrix(rnorm(16), 4, 4)
  s1 <- arima.sim(list(ar = c(0.3, 0.6)), n)
  s2 <- arima.sim(list(ma = c(-0.3, 0.3)), n)
  s3 <- rnorm(n)
  s4 <- rnorm(n)

  S <- cbind(s1, s2, s3, s4)
  X <- S %*% t(A)

  boot_res_1 <- AMUSEboot(X, k = 1)
  boot_res_1

  boot_res_2 <- AMUSEboot(X, k = 2)
  boot_res_2

  # Plots of the estimated sources, the last two are white noise
  plot(boot_res_2$S)




