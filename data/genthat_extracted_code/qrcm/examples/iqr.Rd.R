library(qrcm)


### Name: iqr
### Title: Quantile Regression Coefficients Modeling
### Aliases: iqr
### Keywords: models regression

### ** Examples


  ##### Using simulated data in all examples


  ##### Example 1
  
  n <- 1000
  x <- runif(n)
  y <- rnorm(n, 1 + x, 1 + x)
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with 
    # beta0(p) = beta1(p) = 1 + qnorm(p)
                              
  # fit the true model: b(p) = (1 , qnorm(p))
  m1 <- iqr(y ~ x, formula.p = ~ I(qnorm(p)))
  # the fitted quantile regression coefficient functions are
    # beta0(p) = m1$coef[1,1] + m1$coef[1,2]*qnorm(p)
    # beta1(p) = m1$coef[2,1] + m1$coef[2,2]*qnorm(p)

  # a basis b(p) = (1, p), i.e., beta(p) is assumed to be a linear function of p
  m2 <- iqr(y ~ x, formula.p = ~ p)

  # a 'rich' basis b(p) = (1, p, p^2, log(p), log(1 - p))
  m3 <- iqr(y ~ x, formula.p = ~ p + I(p^2) + I(log(p)) + I(log(1 - p)))

  # 'slp' creates an orthogonal spline basis using shifted Legendre polynomials
  m4 <- iqr(y ~ x, formula.p = ~ slp(p, k = 3)) # note that this is the default
  
  # 'plf' creates the basis of a piecewise linear function
  m5 <- iqr(y ~ x, formula.p = ~ plf(p, knots = c(0.1,0.9)))

  
  summary(m1)
  summary(m1, p = c(0.25,0.5,0.75))
  test.fit(m1, R = 25)
  par(mfrow = c(1,2)); plot(m1, ask = FALSE)
  # see the documentation for 'summary.iqr', 'test.fit', and 'plot.iqr'




  ##### Example 2 ### excluding coefficients
  
  n <- 1000
  x <- runif(n)
  qy <- function(p,x){(1 + qnorm(p)) + (1 + log(p))*x}
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
    # beta0(p) = 1 + qnorm(p) 
    # beta1(p) = 1 + log(p)
  
  y <- qy(runif(n), x) # to generate y, plug uniform p in qy(p,x) 
  iqr(y ~ x, formula.p = ~ I(qnorm(p)) + I(log(p)))

  # I would like to exclude log(p) from beta0(p), and qnorm(p) from beta1(p)
  # I set to 0 the corresponding entries of 's'

  s <- matrix(1,2,3); s[1,3] <- s[2,2] <- 0
  iqr(y ~ x, formula.p = ~ I(qnorm(p)) + I(log(p)), s = s)




  ##### Example 3 ### excluding coefficients when b(p) is singular
  
  n <- 1000
  x <- runif(n)
  qy <- function(p,x){(1 + log(p) - 2*log(1 - p)) + (1 + log(p/(1 - p)))*x} 
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
    # beta0(p) = 1 + log(p) - 2*log(1 - p)
    # beta1(p) = 1 + log(p/(1 - p))

  y <- qy(runif(n), x) # to generate y, plug uniform p in qy(p,x)

  iqr(y ~ x, formula.p = ~ I(log(p)) + I(log(1 - p)) + I(log(p/(1 - p))))
  # log(p/(1 - p)) is dropped due to singularity
  
  # I want beta0(p) to be a function of log(p) and log(1 - p),
  # and beta1(p) to depend on log(p/(1 - p)) alone

  s <- matrix(1,2,4); s[2,2:3] <- 0
  iqr(y ~ x, formula.p = ~ I(log(p)) + I(log(1 - p)) + I(log(p/(1 - p))), s = s)
  # log(p/(1 - p)) is not dropped




  ##### Example 4 ### using slp to test deviations from normality
  
  n <- 1000
  x <- runif(n)
  y <- rnorm(n, 2 + x) 
  # the true model is normal, i.e., b(p) = (1, qnorm(p))
  
  summary(iqr(y ~ x, formula.p = ~ I(qnorm(p)) + slp(p,3))) 
  # if slp(p,3) is not significant, no deviation from normality




  ##### Example 5 ### formula without intercept
  
  n <- 1000
  x <- runif(n)
  y <- runif(n, 0,x) 

  # True quantile function: Q(p | x) = p*x, i.e., beta0(p) = 0, beta1(p) = p
  # When x = 0, all quantiles of y are 0, i.e., the distribution is degenerated
  # To explicitly model this, remove the intercept from 'formula'
  
  iqr(y ~ -1 + x, formula.p = ~ p)
  
  # the true model does not have intercept in b(p) either:

  iqr(y ~ -1 + x, formula.p = ~ -1 + p)




  ##### Example 6 ### no covariates, strictly positive outcome
  
  n <- 1000
  y <- rgamma(n, 3,1) 

  # you know that Q(0) = 0
  # remove intercept from 'formula.p', and use b(p) such that b(0) = 0
  
  summary(iqr(y ~ 1, formula.p = ~ -1 + slp(p,5))) # shifted Legendre polynomials
  summary(iqr(y ~ 1, formula.p = ~ -1 + sin(p*pi/2) + I(qbeta(p,2,4)))) # unusual basis
  summary(iqr(y ~ 1, formula.p = ~ -1 + I(sqrt(p))*I(log(1 - p)))) # you can include interactions




  ##### Example 7 ### revisiting the classical linear model
  
  n <- 1000
  x <- runif(n)
  y <- 2 + 3*x + rnorm(n,0,1) # beta0 = 2, beta1 = 3
  
  iqr(y ~ x, formula.p = ~ I(qnorm(p)), s = matrix(c(1,1,1,0),2))
  # first column of coefficients: (beta0, beta1)
  # top-right coefficient: residual standard deviation
  



  ##### Example 8 ### censored data
  
  n <- 1000
  x <- runif(n,0,5)
	
  u <- runif(n)
  beta0 <- -log(1 - u)
  beta1 <- 0.2*log(1 - u)
  t <- beta0 + beta1*x  # time variable
  c <- rexp(n,2)        # censoring variable
  y <- pmin(t,c)        # observed events
  d <- (t <= c)         # 1 = event, 0 = censored
  
  iqr(Surv(y,d) ~ x, formula.p = ~ I(log(1 - p)))
  
  ##### Example 8 (cont.) ### censored and truncated data

  z <- rexp(n,10)   # truncation variable
  w <- which(y > z) # only observe z,y,d,x when y > z
  z <- z[w]; y <- y[w]; d <- d[w]; x <- x[w]

  iqr(Surv(z,y,d) ~ x, formula.p = ~ I(log(1 - p)))



