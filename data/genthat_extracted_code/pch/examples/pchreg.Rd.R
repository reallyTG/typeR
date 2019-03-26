library(pch)


### Name: pchreg
### Title: Piecewise Constant Hazards Models
### Aliases: pchreg
### Keywords: survival models regression

### ** Examples


  # using simulated data
  
  n <- 1000
  x <- runif(n)
  time <- rnorm(n, 1 + x, 1 + x)
  cens <- rnorm(n,2,2)
  y <- pmin(time,cens) # censored variable
  d <- (time <= cens) # indicator of the event

  model <- pchreg(Surv(y,d) ~ x, breaks = 20)

  # see the documentation of predict.pch



