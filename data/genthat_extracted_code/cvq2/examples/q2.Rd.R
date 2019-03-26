library(cvq2)


### Name: q2
### Title: Model prediction power calculation.
### Aliases: q2 qsq qsquare cvq2 cvqsq cvqsquare looq2
### Keywords: calibration performance cross validation cross-validation
###   model calibration prediction performance prediction power predictive
###   squared correlation coefficient q^2 q square root mean square error

### ** Examples

  require(methods)
  require(stats)
  library(cvq2)
  
  data(cvq2.sample.A)
  result <- cvq2( cvq2.sample.A )
  result
  
  data(cvq2.sample.B)
  result <- cvq2( cvq2.sample.B, y ~ x, nFold = 3 )
  result
  
  data(cvq2.sample.B)
  result <- cvq2( cvq2.sample.B, y ~ x, nFold = 3, nRun = 5 )
  result
  
  data(cvq2.sample.A)
  result <- looq2( cvq2.sample.A, y ~ x1 + x2 )
  result
  
  data(cvq2.sample.A)
  data(cvq2.sample.A_pred)
  result <- q2( cvq2.sample.A, cvq2.sample.A, y ~ x1 + x2 )
  result 



