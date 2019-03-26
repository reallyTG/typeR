library(EnvStats)


### Name: elnorm
### Title: Estimate Parameters of a Lognormal Distribution (Log-Scale)
### Aliases: elnorm
### Keywords: distribution htest

### ** Examples

  # Using the Reference area TcCB data in the data frame EPA.94b.tccb.df, 
  # estimate the mean and standard deviation of the log-transformed distribution, 
  # and construct a 95% confidence interval for the mean.

  with(EPA.94b.tccb.df, elnorm(TcCB[Area == "Reference"], ci = TRUE))  

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.6195712
  #                                 sdlog   =  0.4679530
  #
  #Estimation Method:               mvue
  #
  #Data:                            TcCB[Area == "Reference"]
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



