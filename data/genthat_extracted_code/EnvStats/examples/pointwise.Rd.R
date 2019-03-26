library(EnvStats)


### Name: pointwise
### Title: Pointwise Confidence Limits for Predictions
### Aliases: pointwise
### Keywords: models regression

### ** Examples

  # Using the data in the built-in data frame Air.df, 
  # fit the cube root of ozone as a function of temperature. 
  # Then compute predicted values for ozone at 70 and 90 
  # degrees F, and compute 95% confidence intervals for the 
  # mean value of ozone at these temperatures.

  # First create the lm object 
  #---------------------------

  ozone.fit <- lm(ozone ~ temperature, data = Air.df) 


  # Now get predicted values and CIs at 70 and 90 degrees 
  #------------------------------------------------------

  predict.list <- predict(ozone.fit, 
    newdata = data.frame(temperature = c(70, 90)), se.fit = TRUE) 

  pointwise(predict.list, coverage = 0.95) 
  # $upper
  #        1        2 
  # 2.839145 4.278533 

  # $fit
  #        1        2 
  # 2.697810 4.101808 

  # $lower
  #        1        2 
  # 2.556475 3.925082 

  #--------------------------------------------------------------------

  # Continuing with the above example, create a scatterplot of ozone 
  # vs. temperature, and add the fitted line along with simultaneous 
  # 95% confidence bands.

  x <- Air.df$temperature 

  y <- Air.df$ozone 

  dev.new()
  plot(x, y, xlab="Temperature (degrees F)",  
    ylab = expression(sqrt("Ozone (ppb)", 3))) 

  abline(ozone.fit, lwd = 2) 

  new.x <- seq(min(x), max(x), length=100) 

  predict.ozone <- predict(ozone.fit, 
    newdata = data.frame(temperature = new.x), se.fit = TRUE) 

  ci.ozone <- pointwise(predict.ozone, coverage=0.95, 
    simultaneous=TRUE) 

  lines(new.x, ci.ozone$lower, lty=2, lwd = 2, col = 2) 

  lines(new.x, ci.ozone$upper, lty=2, lwd = 2, col = 2) 

  title(main=paste("Cube Root Ozone vs. Temperature with Fitted Line", 
    "and Simultaneous 95% Confidence Bands", 
    sep="\n")) 

  #--------------------------------------------------------------------

  # Redo the last example by creating non-simultaneous 
  # confidence bounds and prediction bounds as well.

  dev.new()
  plot(x, y, xlab = "Temperature (degrees F)", 
    ylab = expression(sqrt("Ozone (ppb)", 3))) 

  abline(ozone.fit, lwd = 2) 

  new.x <- seq(min(x), max(x), length=100) 

  predict.ozone <- predict(ozone.fit, 
    newdata = data.frame(temperature = new.x), se.fit = TRUE) 

  ci.ozone <- pointwise(predict.ozone, coverage=0.95) 

  lines(new.x, ci.ozone$lower, lty=2, col = 2, lwd = 2) 

  lines(new.x, ci.ozone$upper, lty=2, col = 2, lwd = 2) 

  pi.ozone <- pointwise(predict.ozone, coverage = 0.95, 
    individual = TRUE)

  lines(new.x, pi.ozone$lower, lty=4, col = 4, lwd = 2) 

  lines(new.x, pi.ozone$upper, lty=4, col = 4, lwd = 2) 

  title(main=paste("Cube Root Ozone vs. Temperature with Fitted Line", 
    "and 95% Confidence and Prediction Bands", 
    sep="\n")) 

  #--------------------------------------------------------------------

  # Clean up
  rm(predict.list, ozone.fit, x, y, new.x, predict.ozone, ci.ozone, 
    pi.ozone)



