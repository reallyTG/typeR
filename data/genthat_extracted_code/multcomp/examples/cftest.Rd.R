library(multcomp)


### Name: cftest
### Title: Testing Estimated Coefficients
### Aliases: cftest
### Keywords: htest

### ** Examples


  lmod <- lm(dist ~ speed, data = cars)
  summary(lmod)
  cftest(lmod)
  



