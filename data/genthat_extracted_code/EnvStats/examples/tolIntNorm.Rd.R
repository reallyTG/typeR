library(EnvStats)


### Name: tolIntNorm
### Title: Tolerance Interval for a Normal Distribution
### Aliases: tolIntNorm
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a normal distribution with parameters 
  # mean=10 and sd=2, then create a tolerance interval. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 
  dat <- rnorm(20, mean = 10, sd = 2) 
  tolIntNorm(dat)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 9.861160
  #                                 sd   = 1.180226
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact
  #
  #Tolerance Interval Type:         two-sided
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  6.603328
  #                                 UTL = 13.118993

  #----------

  # Clean up
  rm(dat)
  
  #--------------------------------------------------------------------

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal distribution.  
  # The data for this example are stored in EPA.09.Ex.17.3.chrysene.df, 
  # which contains chrysene concentration data (ppb) found in water 
  # samples obtained from two background wells (Wells 1 and 2) and 
  # three compliance wells (Wells 3, 4, and 5).  The tolerance limit 
  # is based on the data from the background wells.

  # Here we will first take the log of the data and  
  # then construct the tolerance interval; note however that it is 
  # easier to call the function tolIntLnorm instead using the 
  # original data.

  head(EPA.09.Ex.17.3.chrysene.df)
  #  Month   Well  Well.type Chrysene.ppb
  #1     1 Well.1 Background         19.7
  #2     2 Well.1 Background         39.2
  #3     3 Well.1 Background          7.8
  #4     4 Well.1 Background         12.8
  #5     1 Well.2 Background         10.2
  #6     2 Well.2 Background          7.2

  longToWide(EPA.09.Ex.17.3.chrysene.df, "Chrysene.ppb", "Month", "Well")
  #  Well.1 Well.2 Well.3 Well.4 Well.5
  #1   19.7   10.2   68.0   26.8   47.0
  #2   39.2    7.2   48.9   17.7   30.5
  #3    7.8   16.1   30.1   31.9   15.0
  #4   12.8    5.7   38.1   22.2   23.4

  tol.int.list <- with(EPA.09.Ex.17.3.chrysene.df, 
    tolIntNorm(log(Chrysene.ppb[Well.type == "Background"]), 
    ti.type = "upper", coverage = 0.95, conf.level = 0.95))

  tol.int.list

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 2.5085773
  #                                 sd   = 0.6279479
  #
  #Estimation Method:               mvue
  #
  #Data:                            log(Chrysene.ppb[Well.type == "Background"])
  #
  #Sample Size:                     8
  #
  #Tolerance Interval Coverage:     95%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =     -Inf
  #                                 UTL = 4.510032

  # Compute the upper tolerance interaval on the original scale
  # by exponentiating the upper tolerance limit:

  exp(tol.int.list$interval$limits["UTL"])
  #    UTL 
  #90.9247

  #----------

  # Clean up

  rm(tol.int.list)



