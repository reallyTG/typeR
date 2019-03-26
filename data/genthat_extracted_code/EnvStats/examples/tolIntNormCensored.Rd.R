library(EnvStats)


### Name: tolIntNormCensored
### Title: Tolerance Interval for a Normal Distribution Based on Censored
###   Data
### Aliases: tolIntNormCensored
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a normal distribution with parameters 
  # mean=10 and sd=3, censor the observations less than 9, 
  # then create a one-sided upper tolerance interval with 90% 
  # coverage and 95% confidence based on these Type I left, singly 
  # censored data. 
  # (Note: the call to set.seed allows you to reproduce this example.

  set.seed(250) 
  dat <- sort(rnorm(20, mean = 10, sd = 3))
  dat
  # [1]  6.406313  7.126621  8.119660  8.277216  8.426941  8.847961
  # [7]  8.899098  9.357509  9.525756  9.534858  9.558567  9.847663
  #[13] 10.001989 10.014964 10.841384 11.386264 11.721850 12.524300
  #[19] 12.602469 12.813429

  censored <- dat < 9
  dat[censored] <- 9
 
  tolIntNormCensored(dat, censored, coverage = 0.9, ti.type="upper")

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              9 
  #
  #Estimated Parameter(s):          mean = 9.700962
  #                                 sd   = 1.845067
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     20
  #
  #Percent Censored:                35%
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
  #Tolerance Interval:              LTL =     -Inf
  #                                 UTL = 13.25454
## Not run: 
##D 
##D   # Note:  The true 90'th percentile is 13.84465
##D   #---------------------------------------------
##D   qnorm(0.9, mean = 10, sd = 3)
##D   # [1] 13.84465
##D 
##D   # Compare the result using the method "gpq"
##D   tolIntNormCensored(dat, censored, coverage = 0.9, ti.type="upper", 
##D     ti.method = "gpq", seed = 432)$interval$limits
##D   #     LTL      UTL 
##D   #    -Inf 13.56826 
##D 
##D   # Clean Up
##D   #---------
##D   rm(dat, censored)
##D 
##D   #==========
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
##D     tolIntNormCensored(log(Manganese.ppb), Censored, coverage = 0.9, 
##D       ti.type = "upper"))
##D 
##D   # Results of Distribution Parameter Estimation
##D   # Based on Type I Censored Data
##D   # --------------------------------------------
##D   #
##D   # Assumed Distribution:            Normal
##D   #
##D   # Censoring Side:                  left
##D   #
##D   # Censoring Level(s):              0.6931472 1.6094379 
##D   #
##D   # Estimated Parameter(s):          mean = 2.215905
##D   #                                  sd   = 1.356291
##D   #
##D   # Estimation Method:               MLE
##D   #
##D   # Data:                            log(Manganese.ppb)
##D   #
##D   # Censoring Variable:              censored
##D   #
##D   # Sample Size:                     25
##D   #
##D   # Percent Censored:                24##D 
##D   #
##D   # Assumed Sample Size:             25
##D   #
##D   # Tolerance Interval Coverage:     90##D 
##D   #
##D   # Coverage Type:                   content
##D   #
##D   # Tolerance Interval Method:       Exact for
##D   #                                  Complete Data
##D   #
##D   # Tolerance Interval Type:         upper
##D   #
##D   # Confidence Level:                95##D 
##D   #
##D   # Tolerance Interval:              LTL =     -Inf
##D   #                                  UTL = 4.708904
##D   
## End(Not run)



