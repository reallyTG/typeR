library(cvq2)


### Name: predPow
### Title: Statistical analysis of a model results compared to
###   observations.
### Aliases: predPow predictionPower calibPow calibrationPower
### Keywords: calibration performance model calibration prediction
###   performance prediction power predictive squared correlation
###   coefficient q^2 q square root mean square error

### ** Examples

  require(methods)
  require(stats)
  library(cvq2)
  
  data(cvq2.sample.C)
  result <- calibPow( cvq2.sample.C )
  result
  
  data(cvq2.sample.D)
  result <- predPow( cvq2.sample.D, obs_mean="observed_mean" )
  result



