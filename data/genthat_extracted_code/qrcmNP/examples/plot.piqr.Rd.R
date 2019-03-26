library(qrcmNP)


### Name: plot.piqr
### Title: Plot Penalized Quantile Regression Coefficients
### Aliases: plot.piqr
### Keywords: methods

### ** Examples


  # using simulated data

  n <- 300
  x <- runif(n)
  qy <- function(p,x){p^2 + x*log(p)}
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
     # beta0(p) = p^2
     # beta1(p) = log(p)
  y <- qy(runif(n), x) # to generate y, plug uniform p in qy(p,x)

  obj <- piqr(y ~ x, formula.p = ~ slp(p,3), nlambda=50)
  best <- gof.piqr(obj, method="BIC", plot=FALSE)
  par(mfrow = c(2,2))
  plot(obj, xvar="norm")
  plot(obj, xvar="lambda")
  plot(obj, xvar="objective")
  plot(obj, xvar="grad")
  par(mfrow=c(1,2));plot(obj, xvar="beta", lambda=best$minLambda, ask=FALSE)
  # flexible fit with shifted Legendre polynomials



