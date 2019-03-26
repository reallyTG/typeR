library(Mqrcm)


### Name: iMqr
### Title: M-Quantile Regression Coefficients Modeling
### Aliases: iMqr
### Keywords: models regression

### ** Examples


  ##### Using simulated data in all examples
  ##### NOTE 1: the true quantile and M-quantile functions do not generally coincide
  ##### NOTE 2: the true M-quantile function is usually unknown, even with simulated data
  
  
  ##### Example 1
  
  n <- 250
  x <- runif(n)
  y <- rnorm(n, 1 + x, 1 + x)
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with 
    # beta0(p) = beta1(p) = 1 + qnorm(p)
                              
  # fit the 'true' model: b(p) = (1 , qnorm(p))
  m1 <- iMqr(y ~ x, formula.p = ~ I(qnorm(p)))
  # the fitted M-quantile regression coefficient functions are
    # beta0(p) = m1$coef[1,1] + m1$coef[1,2]*qnorm(p)
    # beta1(p) = m1$coef[2,1] + m1$coef[2,2]*qnorm(p)
  ## No test: 
  # a basis b(p) = (1, p), i.e., beta(p) is assumed to be a linear function of p
  m2 <- iMqr(y ~ x, formula.p = ~ p)

  # a 'rich' basis b(p) = (1, p, p^2, log(p), log(1 - p))
  m3 <- iMqr(y ~ x, formula.p = ~ p + I(p^2) + I(log(p)) + I(log(1 - p)))

  # 'slp' creates an orthogonal spline basis using shifted Legendre polynomials
  m4 <- iMqr(y ~ x, formula.p = ~ slp(p, k = 3)) # note that this is the default
  
  # 'plf' creates the basis of a piecewise linear function
  m5 <- iMqr(y ~ x, formula.p = ~ plf(p, knots = c(0.1,0.9)))
  
## End(No test)
  
  summary(m1)
  summary(m1, p = c(0.25,0.5,0.75))
  par(mfrow = c(1,2)); plot(m1, ask = FALSE)
  # see the documentation for 'summary.iMqr' and 'plot.iMqr'

  

  ## No test: 
  ##### Example 2 ### excluding coefficients
  
  n <- 250
  x <- runif(n)
  qy <- function(p,x){(1 + qnorm(p)) + (1 + log(p))*x}
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
    # beta0(p) = 1 + qnorm(p) 
    # beta1(p) = 1 + log(p)
  
  y <- qy(runif(n), x) # to generate y, plug uniform p in qy(p,x) 
  iMqr(y ~ x, formula.p = ~ I(qnorm(p)) + I(log(p)))

  # I would like to exclude log(p) from beta0(p), and qnorm(p) from beta1(p)
  # I set to 0 the corresponding entries of 's'

  s <- matrix(1,2,3); s[1,3] <- s[2,2] <- 0
  iMqr(y ~ x, formula.p = ~ I(qnorm(p)) + I(log(p)), s = s)
  
## End(No test)



