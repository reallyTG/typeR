library(EnvStats)


### Name: calibrate
### Title: Fit a Calibration Line or Curve
### Aliases: calibrate
### Keywords: models regression

### ** Examples

  # The data frame EPA.97.cadmium.111.df contains calibration data for 
  # cadmium at mass 111 (ng/L) that appeared in Gibbons et al. (1997b) 
  # and were provided to them by the U.S. EPA.  
  # Display a plot of these data along with the fitted calibration line 
  # and 99% non-simultaneous prediction limits.  See 
  # Millard and Neerchal (2001, pp.566-569) for more details on this 
  # example.

  Cadmium <- EPA.97.cadmium.111.df$Cadmium 

  Spike <- EPA.97.cadmium.111.df$Spike 

  calibrate.list <- calibrate(Cadmium ~ Spike, data = EPA.97.cadmium.111.df) 
 
  newdata <- data.frame(Spike = seq(min(Spike), max(Spike), len = 100))
 
  pred.list <- predict(calibrate.list, newdata = newdata, se.fit = TRUE) 

  pointwise.list <- pointwise(pred.list, coverage = 0.99, individual = TRUE) 

  dev.new()
  plot(Spike, Cadmium, ylim = c(min(pointwise.list$lower), 
    max(pointwise.list$upper)), xlab = "True Concentration (ng/L)", 
    ylab = "Observed Concentration (ng/L)") 

  abline(calibrate.list, lwd = 2) 

  lines(newdata$Spike, pointwise.list$lower, lty = 8, lwd = 2) 

  lines(newdata$Spike, pointwise.list$upper, lty = 8, lwd = 2) 

  title(paste("Calibration Line and 99% Prediction Limits", 
    "for US EPA Cadmium 111 Data", sep = "\n"))

  #----------

  # Clean up
  #---------
  rm(Cadmium, Spike, newdata, calibrate.list, pred.list, pointwise.list)
  graphics.off()



