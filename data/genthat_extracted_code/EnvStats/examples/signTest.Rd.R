library(EnvStats)


### Name: signTest
### Title: One-Sample or Paired-Sample Sign Test on a Median
### Aliases: signTest 'sign test'
### Keywords: htest models

### ** Examples

  # Generate 10 observations from a lognormal distribution with parameters 
  # meanlog=2 and sdlog=1.  The median of this distribution is e^2 (about 7.4). 
  # Test the null hypothesis that the true median is equal to 5 against the 
  # alternative that the true mean is greater than 5. 
  # (Note: the call to set.seed allows you to reproduce this example).

  set.seed(23) 
  dat <- rlnorm(10, meanlog = 2, sdlog = 1) 
  signTest(dat, mu = 5) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 median = 5
  #
  #Alternative Hypothesis:          True median is not equal to 5
  #
  #Test Name:                       Sign test
  #
  #Estimated Parameter(s):          median = 19.21717
  #
  #Data:                            dat
  #
  #Test Statistic:                  # Obs > median = 9
  #
  #P-value:                         0.02148438
  #
  #Confidence Interval for:         median
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                93.45703%
  #
  #Confidence Limit Rank(s):        3 9 
  #
  #Confidence Interval:             LCL =  7.732538
  #                                 UCL = 35.722459

  # Clean up
  #---------
  rm(dat)

  #==========

  # The guidance document "Supplemental Guidance to RAGS: Calculating the 
  # Concentration Term" (USEPA, 1992d) contains an example of 15 observations 
  # of chromium concentrations (mg/kg) which are assumed to come from a 
  # lognormal distribution.  These data are stored in the vector 
  # EPA.92d.chromium.vec.  Here, we will use the sign test to test the null 
  # hypothesis that the median chromium concentration is less than or equal to 
  # 100 mg/kg vs. the alternative that it is greater than 100 mg/kg.  The 
  # estimated median is 110 mg/kg.  There are 8 out of 15 observations greater 
  # than 100 mg/kg, the p-value is equal to 0.5, and the lower 94% confidence 
  # limit is 41 mg/kg.

  signTest(EPA.92d.chromium.vec, mu = 100, alternative = "greater") 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 median = 100
  #
  #Alternative Hypothesis:          True median is greater than 100
  #
  #Test Name:                       Sign test
  #
  #Estimated Parameter(s):          median = 110
  #
  #Data:                            EPA.92d.chromium.vec
  #
  #Test Statistic:                  # Obs > median = 8
  #
  #P-value:                         0.5
  #
  #Confidence Interval for:         median
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        lower
  #
  #Confidence Level:                94.07654%
  #
  #Confidence Limit Rank(s):        5 
  #
  #Confidence Interval:             LCL =  41
  #                                 UCL = Inf



