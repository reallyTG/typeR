library(EnvStats)


### Name: eqnormCensored
### Title: Estimate Quantiles of a Normal Distribution Based on Type I
###   Censored Data
### Aliases: eqnormCensored
### Keywords: distribution htest

### ** Examples

  # Generate 15 observations from a normal distribution with 
  # parameters mean=10 and sd=2, and censor observations less than 8. 
  # Then generate 15 more observations from this distribution and  censor 
  # observations less than 7.
  # Then estimate the 90th percentile and create a one-sided upper 95% 
  # confidence interval for that percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(47) 

  x.1 <- rnorm(15, mean = 10, sd = 2) 
  sort(x.1)
  # [1]  6.343542  7.068499  7.828525  8.029036  8.155088  9.436470
  # [7]  9.495908 10.030262 10.079205 10.182946 10.217551 10.370811
  #[13] 10.987640 11.422285 13.989393
  censored.1 <- x.1 < 8
  x.1[censored.1] <- 8

  x.2 <- rnorm(15, mean = 10, sd = 2) 
  sort(x.2)
  # [1]  5.355255  6.065562  6.783680  6.867676  8.219412  8.593224
  # [7]  9.319168  9.347066  9.837844  9.918844 10.055054 10.498296
  #[13] 10.834382 11.341558 12.528482
  censored.2 <- x.2 < 7
  x.2[censored.2] <- 7

  x <- c(x.1, x.2)
  censored <- c(censored.1, censored.2)

  eqnormCensored(x, censored, p = 0.9, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              7 8 
  #
  #Estimated Parameter(s):          mean = 9.390624
  #                                 sd   = 1.827156
  #
  #Estimation Method:               MLE
  #
  #Estimated Quantile(s):           90'th %ile = 11.73222
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 MLE Estimators
  #
  #Data:                            x
  #
  #Censoring Variable:              censored
  #  
  #Sample Size:                     30
  #
  #Percent Censored:                16.66667%
  #
  #Confidence Interval for:         90'th %ile
  #
  #Assumed Sample Size:             30
  #
  #Confidence Interval Method:      Exact for
  #                                 Complete Data
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =     -Inf
  #                                 UCL = 12.63808

  #----------

  # Compare these results with the true 90'th percentile:

  qnorm(p = 0.9, mean = 10, sd = 2)
  #[1] 12.56310

  #----------

  # Clean up
  rm(x.1, censored.1, x.2, censored.2, x, censored)
  
  #==========

  # Chapter 15 of USEPA (2009) gives several examples of estimating the mean
  # and standard deviation of a lognormal distribution on the log-scale using 
  # manganese concentrations (ppb) in groundwater at five background wells. 
  # In EnvStats these data are stored in the data frame 
  # EPA.09.Ex.15.1.manganese.df.

  # Here we will estimate the mean and standard deviation using the MLE, 
  # and then construct an upper 95% confidence limit for the 90th percentile. 

  # We will log-transform the original observations and then call 
  # eqnormCensored.  Alternatively, we could have more simply called 
  # eqlnormCensored.

  # First look at the data:
  #-----------------------

  EPA.09.Ex.15.1.manganese.df

  #   Sample   Well Manganese.Orig.ppb Manganese.ppb Censored
  #1       1 Well.1                 <5           5.0     TRUE
  #2       2 Well.1               12.1          12.1    FALSE
  #3       3 Well.1               16.9          16.9    FALSE
  #...
  #23      3 Well.5                3.3           3.3    FALSE
  #24      4 Well.5                8.4           8.4    FALSE
  #25      5 Well.5                 <2           2.0     TRUE

  longToWide(EPA.09.Ex.15.1.manganese.df, 
    "Manganese.Orig.ppb", "Sample", "Well",
    paste.row.name = TRUE)  

  #         Well.1 Well.2 Well.3 Well.4 Well.5
  #Sample.1     <5     <5     <5    6.3   17.9
  #Sample.2   12.1    7.7    5.3   11.9   22.7
  #Sample.3   16.9   53.6   12.6     10    3.3
  #Sample.4   21.6    9.5  106.3     <2    8.4
  #Sample.5     <2   45.9   34.5   77.2     <2


  # Now estimate the mean, standard deviation, and 90th percentile 
  # on the log-scale using the MLE, and construct an upper 95% 
  # confidence limit for the 90th percentile on the log-scale:
  #---------------------------------------------------------------

  est.list <- with(EPA.09.Ex.15.1.manganese.df,
    eqnormCensored(log(Manganese.ppb), Censored, 
      p = 0.9, ci = TRUE, ci.type = "upper"))

  est.list

  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              0.6931472 1.6094379 
  #
  #Estimated Parameter(s):          mean = 2.215905
  #                                 sd   = 1.356291
  #
  #Estimation Method:               MLE
  #
  #Estimated Quantile(s):           90'th %ile = 3.954062
  #
  #Quantile Estimation Method:      Quantile(s) Based on
  #                                 MLE Estimators
  #
  #Data:                            log(Manganese.ppb)
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%
  #
  #Confidence Interval for:         90'th %ile
  #
  #Assumed Sample Size:             25
  #
  #Confidence Interval Method:      Exact for
  #                                 Complete Data
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =     -Inf
  #                                 UCL = 4.708904

  # To estimate the 90th percentile on the original scale, 
  # we need to exponentiate the results
  #-------------------------------------------------------
  exp(est.list$quantiles)
  #90'th %ile 
  #  52.14674 

  exp(est.list$interval$limits)
  #     LCL      UCL 
  #  0.0000 110.9305

  #----------

  # Clean up
  #---------
  rm(est.list)



