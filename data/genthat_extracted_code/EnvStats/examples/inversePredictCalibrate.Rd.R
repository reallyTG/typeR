library(EnvStats)


### Name: inversePredictCalibrate
### Title: Predict Concentration Using Calibration
### Aliases: inversePredictCalibrate
### Keywords: models regression

### ** Examples

  # The data frame EPA.97.cadmium.111.df contains calibration data 
  # for cadmium at mass 111 (ng/L) that appeared in 
  # Gibbons et al. (1997b) and were provided to them by the U.S. EPA.  
  # Here we 
  # 1. Display a plot of these data along with the fitted calibration 
  #    line and 99% non-simultaneous prediction limits. 
  # 2. Then based on an observed signal of 60 from a sample with 
  #    unknown concentration, we use the calibration line to estimate 
  #    the true concentration and use the prediction limits to compute 
  #    confidence bounds for the true concentration. 
  # An observed signal of 60 results in an estimated value of cadmium 
  # of 59.97 ng/L and a confidence interval of [53.83, 66.15]. 
  # See Millard and Neerchal (2001, pp.566-569) for more details on 
  # this example.

  Cadmium <- EPA.97.cadmium.111.df$Cadmium 

  Spike <- EPA.97.cadmium.111.df$Spike 

  calibrate.list <- calibrate(Cadmium ~ Spike, 
    data = EPA.97.cadmium.111.df) 

  newdata <- data.frame(Spike = seq(min(Spike), max(Spike), 
    length.out = 100))

  pred.list <- predict(calibrate.list, newdata = newdata, se.fit = TRUE) 

  pointwise.list <- pointwise(pred.list, coverage = 0.99, 
    individual = TRUE)

  plot(Spike, Cadmium, ylim = c(min(pointwise.list$lower), 
    max(pointwise.list$upper)), xlab = "True Concentration (ng/L)", 
    ylab = "Observed Concentration (ng/L)") 

  abline(calibrate.list, lwd=2) 

  lines(newdata$Spike, pointwise.list$lower, lty=8, lwd=2) 

  lines(newdata$Spike, pointwise.list$upper, lty=8, lwd=2) 

  title(paste("Calibration Line and 99% Prediction Limits", 
    "for US EPA Cadmium 111 Data", sep = "\n")) 

 
  # Now estimate the true concentration based on 
  # an observed signal of 60 ng/L. 

  inversePredictCalibrate(calibrate.list, obs.y = 60, 
    intervals = TRUE, coverage = 0.99, individual = TRUE) 

  #     obs.y   pred.x   lpl.x    upl.x 
  #[1,]    60 59.97301 53.8301 66.15422 
  #attr(, "coverage"): 
  #[1] 0.99 
  #attr(, "simultaneous"): 
  #[1] FALSE

  rm(Cadmium, Spike, calibrate.list, newdata, pred.list, pointwise.list) 



