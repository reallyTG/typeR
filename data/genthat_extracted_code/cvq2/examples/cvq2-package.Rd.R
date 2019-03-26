library(cvq2)


### Name: cvq2-package
### Title: Calculate the predictive squared correlation coefficient.
### Aliases: cvq2-package
### Keywords: calibration performance cross validation cross-validation
###   model calibration prediction performance prediction power predictive
###   squared correlation coefficient q^2 q square root mean square error

### ** Examples

  library(cvq2)
  
  data(cvq2.sample.A)
  result <- cvq2( cvq2.sample.A, y ~ x1 + x2 )
  result
  
  data(cvq2.sample.B)
  result <- cvq2( cvq2.sample.B, y ~ x, nFold = 3 )
  result
  
  data(cvq2.sample.B)
  result <- cvq2( cvq2.sample.B, y ~ x, nFold = 3, nRun = 5 )
  result
  
  data(cvq2.sample.A)
  data(cvq2.sample.A_pred)
  result <- q2( cvq2.sample.A, cvq2.sample.A_pred, y ~ x1 + x2 )
  result
  
  data(cvq2.sample.C)
  result <- calibPow( cvq2.sample.C )
  result
  
  data(cvq2.sample.D)
  result <- predPow( cvq2.sample.D, obs_mean="observed_mean" )
  result



