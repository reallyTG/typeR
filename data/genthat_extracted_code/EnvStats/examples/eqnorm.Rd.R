library(EnvStats)


### Name: eqnorm
### Title: Estimate Quantiles of a Normal Distribution
### Aliases: eqnorm
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a normal distribution with 
  # parameters mean=10 and sd=2, then estimate the 90th 
  # percentile and create a one-sided upper 95% confidence interval 
  # for that percentile. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(47) 
  dat <- rnorm(20, mean = 10, sd = 2) 
  eqnorm(dat, p = 0.9, ci = TRUE, ci.type = "upper")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 9.792856
  #                                 sd   = 1.821286
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           90'th %ile = 12.12693
  #
  #Quantile Estimation Method:      qmle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         90'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =     -Inf
  #                                 UCL = 13.30064

  #----------
  # Compare these results with the true 90'th percentile:

  qnorm(p = 0.9, mean = 10, sd = 2)
  #[1] 12.56310

  #----------

  # Clean up
  rm(dat)

  #==========

  # Example 21-4 of USEPA (2009, p. 21-13) shows how to construct a 
  # 99% lower confidence limit for the 95th percentile using chrysene 
  # data and assuming a lognormal distribution.  The data for this 
  # example are stored in EPA.09.Ex.21.1.aldicarb.df.

  # The facility permit has established an ACL of 30 ppb that should not 
  # be exceeded more than 5% of the time.  Thus, if the lower confidence limit 
  # for the 95th percentile is greater than 30 ppb, the well is deemed to be 
  # out of compliance.

  # Look at the data
  #-----------------

  head(EPA.09.Ex.21.1.aldicarb.df)
  #  Month   Well Aldicarb.ppb
  #1     1 Well.1         19.9
  #2     2 Well.1         29.6
  #3     3 Well.1         18.7
  #4     4 Well.1         24.2
  #5     1 Well.2         23.7
  #6     2 Well.2         21.9

  longToWide(EPA.09.Ex.21.1.aldicarb.df, 
    "Aldicarb.ppb", "Month", "Well", paste.row.name = TRUE)
  #        Well.1 Well.2 Well.3
  #Month.1   19.9   23.7    5.6
  #Month.2   29.6   21.9    3.3
  #Month.3   18.7   26.9    2.3
  #Month.4   24.2   26.1    6.9

  # Estimate the 95th percentile and compute the lower 
  # 99% confidence limit for Well 1.
  #---------------------------------------------------

  with(EPA.09.Ex.21.1.aldicarb.df, 
    eqnorm(Aldicarb.ppb[Well == "Well.1"], p = 0.95, ci = TRUE, 
      ci.type = "lower", conf.level = 0.99))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 23.10000
  #                                 sd   =  4.93491
  #
  #Estimation Method:               mvue
  #
  #Estimated Quantile(s):           95'th %ile = 31.2172
  #
  #Quantile Estimation Method:      qmle
  #
  #Data:                            Aldicarb.ppb[Well == "Well.1"]
  #
  #Sample Size:                     4
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        lower
  #
  #Confidence Level:                99%
  #
  #Confidence Interval:             LCL = 25.2855
  #                                 UCL =     Inf
 

  # Now compute the 99% lower confidence limit for each of the three 
  # wells all at once.
  #------------------------------------------------------------------

  LCLs <- with(EPA.09.Ex.21.1.aldicarb.df, 
    sapply(split(Aldicarb.ppb, Well), 
      function(x) eqnorm(x, p = 0.95, method = "qmle", ci = TRUE, 
      ci.type = "lower", conf.level = 0.99)$interval$limits["LCL"]))

  round(LCLs, 2)
  #Well.1.LCL Well.2.LCL Well.3.LCL 
  #     25.29      25.66       5.46 

  LCLs > 30
  #Well.1.LCL Well.2.LCL Well.3.LCL 
  #     FALSE      FALSE      FALSE


  # Clean up
  #---------

  rm(LCLs)

  
  #==========

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence using chrysene data and assuming a lognormal 
  # distribution.

  # A beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence is equivalent to the 95% upper confidence limit for the 
  # 95th percentile.

  # Here we will construct a 95% upper confidence limit for the 95th 
  # percentile based on the log-transformed data, then exponentiate the 
  # result to get the confidence limit on the original scale.  Note that 
  # it is easier to just use the function eqlnorm with the original data 
  # to achieve the same result.

  attach(EPA.09.Ex.17.3.chrysene.df)
  log.Chrysene <- log(Chrysene.ppb[Well.type == "Background"])
  eqnorm(log.Chrysene, p = 0.95, ci = TRUE, ci.type = "upper")

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
  #Estimated Quantile(s):           95'th %ile = 3.54146
  #
  #Quantile Estimation Method:      qmle
  #
  #Data:                            log.Chrysene
  #
  #Sample Size:                     8
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =     -Inf
  #                                 UCL = 4.510032

  exp(4.510032)
  #[1] 90.92473

  #----------
  # Clean up

  rm(log.Chrysene)
  detach("EPA.09.Ex.17.3.chrysene.df")



