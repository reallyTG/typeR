library(EnvStats)


### Name: tolIntLnormCensored
### Title: Tolerance Interval for a Lognormal Distribution Based on
###   Censored Data
### Aliases: tolIntLnormCensored
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # mean=10 and cv=1, censor the observations less than 5, 
  # then create a one-sided upper tolerance interval with 90% 
  # coverage and 95% confidence based on these Type I left, singly 
  # censored data. 
  # (Note: the call to set.seed allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormAlt(20, mean = 10, cv = 1)
  sort(dat)
  # [1]  2.608298  3.185459  4.196216  4.383764  4.569752  5.136130
  # [7]  5.209538  5.916284  6.199076  6.214755  6.255779  6.778361
  #[13]  7.074972  7.100494  8.930845 10.388766 11.402769 14.247062
  #[19] 14.559506 15.437340

  censored <- dat < 5
  dat[censored] <- 5
 
  tolIntLnormCensored(dat, censored, coverage = 0.9, ti.type="upper")

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              5 
  #
  #Estimated Parameter(s):          meanlog = 1.8993686
  #                                 sdlog   = 0.4804343
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     20
  #
  #Percent Censored:                25%
  #
  #Assumed Sample Size:             20
  #
  #Tolerance Interval Coverage:     90%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact for
  #                                 Complete Data
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Interval:              LTL =  0.00000
  #                                 UTL = 16.85556

## Not run: 
##D   # Note:  The true 90'th percentile is 20.55231
##D   #---------------------------------------------
##D   qlnormAlt(0.9, mean = 10, cv = 1)
##D   #[1] 20.55231
##D 
##D 
##D   # Compare the result using the method "gpq"
##D   tolIntLnormCensored(dat, censored, coverage = 0.9, ti.type="upper", 
##D     ti.method = "gpq", seed = 432)$interval$limits
##D 
##D   #     LTL      UTL 
##D   # 0.00000 17.85474
##D 
##D   # Clean Up
##D   #---------
##D   rm(dat, censored)
##D 
##D   #--------------------------------------------------------------
##D 
##D   # Example 15-1 of USEPA (2009, p. 15-10) shows how to estimate 
##D   # the mean and standard deviation using log-transformed multiply 
##D   # left-censored manganese concentration data.  Here we'll construct a 
##D   # 95##D 
##D 
##D   EPA.09.Ex.15.1.manganese.df
##D   #    Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
##D   # 1       1 Well.1                 <5           5.0     TRUE
##D   # 2       2 Well.1               12.1          12.1    FALSE
##D   # 3       3 Well.1               16.9          16.9    FALSE
##D   # ...
##D   # 23      3 Well.5                3.3           3.3    FALSE
##D   # 24      4 Well.5                8.4           8.4    FALSE
##D   # 25      5 Well.5                 <2           2.0     TRUE
##D 
##D   with(EPA.09.Ex.15.1.manganese.df, 
##D     tolIntLnormCensored(Manganese.ppb, Censored, coverage = 0.9, 
##D       ti.type = "upper"))
##D 
##D   #Results of Distribution Parameter Estimation
##D   #Based on Type I Censored Data
##D   #--------------------------------------------
##D   #
##D   #Assumed Distribution:            Lognormal
##D   #
##D   #Censoring Side:                  left
##D   #
##D   #Censoring Level(s):              2 5 
##D   #
##D   #Estimated Parameter(s):          meanlog = 2.215905
##D   #                                 sdlog   = 1.356291
##D   #
##D   #Estimation Method:               MLE
##D   #
##D   #Data:                            Manganese.ppb
##D   #
##D   #Censoring Variable:              censored
##D   #
##D   #Sample Size:                     25
##D   #
##D   #Percent Censored:                24##D 
##D   #
##D   #Assumed Sample Size:             25
##D   #
##D   #Tolerance Interval Coverage:     90##D 
##D   #
##D   #Coverage Type:                   content
##D   #
##D   #Tolerance Interval Method:       Exact for
##D   #                                 Complete Data
##D   #
##D   #Tolerance Interval Type:         upper
##D   #
##D   #Confidence Level:                95##D 
##D   #
##D   #Tolerance Interval:              LTL =   0.0000
##D   #                                 UTL = 110.9305
##D   
## End(Not run)



