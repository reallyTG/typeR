library(pch)


### Name: predict.pch
### Title: Prediction from Fitted Piecewise Constant Hazards Models
### Aliases: predict.pch
### Keywords: regression

### ** Examples


  # using simulated data
  
  ##### EXAMPLE 1 - Continuous distribution ############################
  
  n <- 1000
  x <- runif(n)
  time <- rnorm(n, 1 + x, 1 + x)
  cens <- rnorm(n,2,2)
  y <- pmin(time,cens) # censored variable
  d <- (time <= cens) # indicator of the event
  model <- pchreg(Surv(y,d) ~ x, breaks = 20)

  # predicting hazard, cumulative hazard, survival, density

  pred <- predict(model, type = "distr")
  plot(pred$Surv, 1 - pnorm(y, 1 + x, 1 + x)); abline(0,1) 
  # true vs fitted survival
  
  
  # predicting quartiles

  predQ <- predict(model, type = "quantile", p = c(0.25,0.5,0.75))
  plot(x,time)
  points(x, qnorm(0.5, 1 + x, 1 + x), col = "red") # true median
  points(x, predQ$p0.5, col = "green")             # fitted median
  
  
  # simulating new data
  
  tsim1 <- predict(model, type = "sim", sim.method = "quantile")
  tsim2 <- predict(model, type = "sim", sim.method = "sample")

  qt <- quantile(time, (1:9)/10)  # deciles of t
  q1 <- quantile(tsim1, (1:9)/10) # deciles of tsim1
  q2 <- quantile(tsim2, (1:9)/10) # deciles of tsim2

  par(mfrow = c(1,2))
  plot(qt,q1, main = "sim.method = 'quantile'"); abline(0,1)
  plot(qt,q2, main = "sim.method = 'sample'"); abline(0,1)

  # prediction with newdata
  
  predict(model, type = "distr", newdata = data.frame(y = 0, x = 0.5)) # need y!
  predict(model, type = "quantile", p = 0.5, newdata = data.frame(x = 0.5))
  predict(model, type = "sim", sim.method = "sample", newdata = data.frame(x = c(0,1)))

  ##### EXAMPLE 2 - non-compact support ############################
  # to simulate, sim.method = "sample" is recommended ##############
  
  n <- 1000
  t <- c(rnorm(n,-5), rnorm(n,5)) 
  model <- pchreg(Surv(t) ~ 1, breaks = 30)
  
  tsim1 <- predict(model, type = "sim", sim.method = "quantile")
  tsim2 <- predict(model, type = "sim", sim.method = "sample")
  
  par(mfrow = c(1,3))
  hist(t, main = "true distribution")
  hist(tsim1, main = "sim.method = 'quantile'") # the empty spaces are 'filled'
  hist(tsim2, main = "sim.method = 'sample'")   # perfect!



