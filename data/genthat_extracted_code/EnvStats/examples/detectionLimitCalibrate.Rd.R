library(EnvStats)


### Name: detectionLimitCalibrate
### Title: Determine Detection Limit
### Aliases: detectionLimitCalibrate 'Detection Limit' 'detection limit'
### Keywords: models regression

### ** Examples

  # The data frame EPA.97.cadmium.111.df contains calibration 
  # data for cadmium at mass 111 (ng/L) that appeared in 
  # Gibbons et al. (1997b) and were provided to them by the U.S. EPA.
  # 
  # The Example section in the help file for calibrate shows how to 
  # plot these data along with the fitted calibration line and 99% 
  # non-simultaneous prediction limits.  
  #
  # For the current example, we will compute the decision limit (7.68) 
  # and detection limit (12.36 ng/L) based on using alpha = beta = 0.01 
  # and a linear calibration line with constant variance. See 
  # Millard and Neerchal (2001, pp.566-575) for more details on this 
  # example.

  calibrate.list <- calibrate(Cadmium ~ Spike, data = EPA.97.cadmium.111.df) 

  detectionLimitCalibrate(calibrate.list, simultaneous = FALSE) 
  #        Decision Limit (Signal) Detection Limit (Concentration) 
  #                       7.677842                       12.364670 
  #attr(,"coverage")
  #[1] 0.99
  #attr(,"simultaneous")
  #[1] FALSE

  #----------

  # Clean up
  #---------
  rm(calibrate.list) 



