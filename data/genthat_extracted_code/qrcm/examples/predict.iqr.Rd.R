library(qrcm)


### Name: predict.iqr
### Title: Prediction After Quantile Regression Coefficients Modeling
### Aliases: predict.iqr
### Keywords: methods

### ** Examples


  # using simulated data
  
  n <- 1000
  x <- runif(n)
  y <- rlogis(n, 1 + x, 1 + x)
  # true quantile function: Q(p | x) = beta0(p) + beta1(p)*x, with
    # beta0(p) = beta1(p) = 1 + log(p/(1 - p))
  
  model <- iqr(y ~ x, formula.p = ~ I(log(p)) + I(log(1 - p))) 
  # (fit asymmetric logistic distribution)
  
  
  # predict beta(0.25), beta(0.5), beta(0.75)
  predict(model, type = "beta", p = c(0.25,0.5, 0.75))
  
  # predict the CDF and the PDF at new values of x and y
  predict(model, type = "CDF", newdata = data.frame(x = c(.1,.2,.3), y = c(1,2,3)))
  
  # computes the quantile function at new x, for p = (0.25,0.5,0.75)
  predict(model, type = "QF", p = c(0.25,0.5,0.75), newdata = data.frame(x = c(.1,.2,.3)))

  # simulate data from the fitted model
  ysim <- predict(model, type = "sim") # 'newdata' can be supplied

  # if the model is correct, the distribution of y and that of ysim should be similar
  qy <- quantile(y, prob = seq(.1,.9,.1))
  qsim <- quantile(ysim, prob = seq(.1,.9,.1))
  plot(qy, qsim); abline(0,1)



