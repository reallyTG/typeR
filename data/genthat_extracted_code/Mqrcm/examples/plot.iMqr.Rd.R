library(Mqrcm)


### Name: plot.iMqr
### Title: Plot M-Quantile Regression Coefficients
### Aliases: plot.iMqr
### Keywords: methods

### ** Examples

  ## No test: 
  # using simulated data
  
  n <- 250
  x <- runif(n)
  qy <- function(p,x){p^2 + x*log(p)}
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
     # beta0(p) = p^2
     # beta1(p) = log(p)
  y <- qy(runif(n), x) # to generate y, plug uniform p in qy(p,x)
  
  par(mfrow = c(1,2))
  plot(iMqr(y ~ x, formula.p = ~ slp(p,3)), ask = FALSE) 
  # flexible fit with shifted Legendre polynomials
  
## End(No test)



