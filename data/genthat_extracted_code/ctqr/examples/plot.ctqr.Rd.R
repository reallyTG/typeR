library(ctqr)


### Name: plot.ctqr
### Title: Plot Quantile Regression Coefficients
### Aliases: plot.ctqr
### Keywords: methods

### ** Examples

  
  # using simulated data
  
  n <- 1000
  x <- runif(n)
  t <- 1 + x + rexp(n)
  c <- runif(n, 1,10)
  y <- pmin(c,t)
  d <- (t <= c)
  
  par(mfrow = c(1,2))
  plot(ctqr(Surv(y,d) ~ x, p = seq(0.05,0.95,0.05)), ask = FALSE) 



