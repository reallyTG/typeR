library(EnvStats)


### Name: calibrate.object
### Title: S3 Class "calibrate"
### Aliases: calibrate.object
### Keywords: classes

### ** Examples

  # Create an object of class "calibrate", then print it out.

  # The data frame EPA.97.cadmium.111.df contains calibration data for 
  # cadmium at mass 111 (ng/L) that appeared in Gibbons et al. (1997b) 
  # and were provided to them by the U.S. EPA. 

  calibrate.list <- calibrate(Cadmium ~ Spike, data = EPA.97.cadmium.111.df) 
 
  names(calibrate.list)

  calibrate.list


  #----------

  # Clean up
  #---------
  rm(calibrate.list)



