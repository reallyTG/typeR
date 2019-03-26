library(EnvStats)


### Name: enorm
### Title: Estimate Parameters of a Normal (Gaussian) Distribution
### Aliases: enorm
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a N(3, 2) distribution, then estimate 
  # the parameters and create a 95% confidence interval for the mean. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rnorm(20, mean = 3, sd = 2) 
  enorm(dat, ci = TRUE) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 2.861160
  #                                 sd   = 1.180226
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 2.308798
  #                                 UCL = 3.413523

  #----------

  # Using the same data, construct an upper 90% confidence interval for
  # the variance.

  enorm(dat, ci = TRUE, ci.type = "upper", ci.param = "variance")$interval

  #Confidence Interval for:         variance
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.000000
  #                                 UCL = 2.615963

  #----------

  # Clean up
  #---------
  rm(dat)

  #----------

  # Using the Reference area TcCB data in the data frame EPA.94b.tccb.df, 
  # estimate the mean and standard deviation of the log-transformed data, 
  # and construct a 95% confidence interval for the mean.

  with(EPA.94b.tccb.df, enorm(log(TcCB[Area == "Reference"]), ci = TRUE))  

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = -0.6195712
  #                                 sd   =  0.4679530
  #
  #Estimation Method:               mvue
  #
  #Data:                            log(TcCB[Area == "Reference"])
  #
  #Sample Size:                     47
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = -0.7569673
  #                                 UCL = -0.4821751



