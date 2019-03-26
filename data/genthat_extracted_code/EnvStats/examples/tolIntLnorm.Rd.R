library(EnvStats)


### Name: tolIntLnorm
### Title: Tolerance Interval for a Lognormal Distribution
### Aliases: tolIntLnorm tolIntLnormAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # meanlog=0 and sdlog=1.  Use tolIntLnorm to estimate 
  # the mean and standard deviation of the log of the true distribution, and 
  # construct a two-sided 90% beta-content tolerance interval with associated 
  # confidence level 95%. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnorm(20) 
  tolIntLnorm(dat, coverage = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = -0.06941976
  #                                 sdlog   =  0.59011300
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Tolerance Interval Coverage:     90%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact
  #
  #Tolerance Interval Type:         two-sided
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL = 0.237457
  #                                 UTL = 3.665369


  # The exact two-sided interval that contains 90% of this distribution 
  # is given by: [0.193, 5.18].  

  qlnorm(p = c(0.05, 0.95))
  #[1] 0.1930408 5.1802516

  # Clean up
  rm(dat)

  #==========

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal distribution.  
  # The data for this example are stored in EPA.09.Ex.17.3.chrysene.df, 
  # which contains chrysene concentration data (ppb) found in water 
  # samples obtained from two background wells (Wells 1 and 2) and 
  # three compliance wells (Wells 3, 4, and 5).  The tolerance limit 
  # is based on the data from the background wells.

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

  with(EPA.09.Ex.17.3.chrysene.df, 
    tolIntLnorm(Chrysene.ppb[Well.type == "Background"], 
    ti.type = "upper", coverage = 0.95, conf.level = 0.95))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          meanlog = 2.5085773
  #                                 sdlog   = 0.6279479
  #
  #Estimation Method:               mvue
  #
  #Data:                            Chrysene.ppb[Well.type == "Background"]
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
  #Tolerance Interval:              LTL =  0.0000
  #                                 UTL = 90.9247

  #----------

  # Repeat the above example, but estimate the mean and 
  # coefficient of variation on the original scale
  #-----------------------------------------------

  with(EPA.09.Ex.17.3.chrysene.df, 
    tolIntLnormAlt(Chrysene.ppb[Well.type == "Background"], 
    ti.type = "upper", coverage = 0.95, conf.level = 0.95))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          mean = 14.5547353
  #                                 cv   =  0.6390825
  #
  #Estimation Method:               mvue
  #
  #Data:                            Chrysene.ppb[Well.type == "Background"]
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
  #Tolerance Interval:              LTL =  0.0000
  #                                 UTL = 90.9247



