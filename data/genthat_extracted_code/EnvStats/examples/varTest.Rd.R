library(EnvStats)


### Name: varTest
### Title: One-Sample Chi-Squared Test on Variance
### Aliases: varTest
### Keywords: htest models

### ** Examples

  # Generate 20 observations from a normal distribution with parameters 
  # mean=2 and sd=1.  Test the null hypothesis that the true variance is 
  # equal to 0.5 against the alternative that the true variance is not 
  # equal to 0.5.  
  # (Note: the call to set.seed allows you to reproduce this example).

  set.seed(23) 
  dat <- rnorm(20, mean = 2, sd = 1) 
  varTest(dat, sigma.squared = 0.5) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 variance = 0.5
  #
  #Alternative Hypothesis:          True variance is not equal to 0.5
  #
  #Test Name:                       Chi-Squared Test on Variance
  #
  #Estimated Parameter(s):          variance = 0.753708
  #
  #Data:                            dat
  #
  #Test Statistic:                  Chi-Squared = 28.64090
  #
  #Test Statistic Parameter:        df = 19
  #
  #P-value:                         0.1436947
  #
  #95% Confidence Interval:         LCL = 0.4359037
  #                                 UCL = 1.6078623

  # Note that in this case we would not reject the 
  # null hypothesis at the 5% or even the 10% level.

  # Clean up
  rm(dat)



