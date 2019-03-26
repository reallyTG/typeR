library(EnvStats)


### Name: predIntGammaSimultaneous
### Title: Simultaneous Prediction Interval for a Gamma Distribution
### Aliases: predIntGammaSimultaneous predIntGammaAltSimultaneous
### Keywords: distribution htest

### ** Examples

  # Generate 8 observations from a gamma distribution with parameters 
  # mean=10 and cv=1, then use predIntGammaAltSimultaneous to estimate the 
  # mean and coefficient of variation of the true distribution and construct an 
  # upper 95% prediction interval to contain at least 1 out of the next 
  # 3 observations. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(479) 
  dat <- rgammaAlt(8, mean = 10, cv = 1) 

  predIntGammaAltSimultaneous(dat, k = 1, m = 3) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          mean = 13.875825
  #                                 cv   =  1.049504
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Sample Size:                     8
  #
  #Prediction Interval Method:      exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on MLE of 'shape'
  #
  #Normal Transform Power:          0.2204908
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain:         1
  #
  #Total Number of
  #Future Observations:             3
  #
  #Prediction Interval:             LPL =  0.00000
  #                                 UPL = 15.87101

  #----------

  # Compare the 95% 1-of-3 upper prediction limit to the California and 
  # Modified California upper prediction limits.  Note that the upper 
  # prediction limit for the Modified California rule is between the limit 
  # for the 1-of-3 rule and the limit for the California rule. 

  predIntGammaAltSimultaneous(dat, k = 1, m = 3)$interval$limits["UPL"] 
  #     UPL 
  #15.87101
 
  predIntGammaAltSimultaneous(dat, m = 3, rule = "CA")$interval$limits["UPL"]  
  #     UPL 
  #34.11499

  predIntGammaAltSimultaneous(dat, rule = "Modified.CA")$interval$limits["UPL"] 
  #     UPL 
  #22.58809 

  #----------

  # Show how the upper 95% simultaneous prediction limit increases 
  # as the number of future sampling occasions r increases.  
  # Here, we'll use the 1-of-3 rule.

  predIntGammaAltSimultaneous(dat, k = 1, m = 3)$interval$limits["UPL"]
  #     UPL 
  #15.87101

  predIntGammaAltSimultaneous(dat, k = 1, m = 3, r = 10)$interval$limits["UPL"]
  #     UPL 
  #37.86825

  #----------

  # Compare the upper simultaneous prediction limit for the 1-of-3 rule 
  # based on individual observations versus based on transformed means of 
  # order 4.

  predIntGammaAltSimultaneous(dat, k = 1, m = 3)$interval$limits["UPL"]
  #     UPL 
  #15.87101

  predIntGammaAltSimultaneous(dat, n.transmean = 4, k = 1, 
    m = 3)$interval$limits["UPL"]
  #     UPL 
  #14.76528 

  #==========

  # Example 19-1 of USEPA (2009, p. 19-17) shows how to compute an 
  # upper simultaneous prediction limit for the 1-of-3 rule for 
  # r = 2 future sampling occasions.  The data for this example are 
  # stored in EPA.09.Ex.19.1.sulfate.df.

  # We will pool data from 4 background wells that were sampled on 
  # a number of different occasions, giving us a sample size of 
  # n = 25 to use to construct the prediction limit.

  # There are 50 compliance wells and we will monitor 10 different 
  # constituents at each well at each of the r=2 future sampling 
  # occasions.  To determine the confidence level we require for 
  # the simultaneous prediction interval, USEPA (2009) recommends 
  # setting the individual Type I Error level at each well to 
 
  # 1 - (1 - SWFPR)^(1 / (Number of Constituents * Number of Wells))
  
  # which translates to setting the confidence limit to 

  # (1 - SWFPR)^(1 / (Number of Constituents * Number of Wells))

  # where SWFPR = site-wide false positive rate.  For this example, we 
  # will set SWFPR = 0.1.  Thus, the confidence level is given by:

  nc <- 10
  nw <- 50
  SWFPR <- 0.1
  conf.level <- (1 - SWFPR)^(1 / (nc * nw))

  conf.level
  #[1] 0.9997893

  #----------

  # Look at the data:

  names(EPA.09.Ex.19.1.sulfate.df)
  #[1] "Well"                 "Month"                "Day"                 
  #[4] "Year"                 "Date"                 "Sulfate.mg.per.l"    
  #[7] "log.Sulfate.mg.per.l"

  EPA.09.Ex.19.1.sulfate.df[, 
    c("Well", "Date", "Sulfate.mg.per.l", "log.Sulfate.mg.per.l")]

  #    Well       Date Sulfate.mg.per.l log.Sulfate.mg.per.l
  #1  GW-01 1999-07-08             63.0             4.143135
  #2  GW-01 1999-09-12             51.0             3.931826
  #3  GW-01 1999-10-16             60.0             4.094345
  #4  GW-01 1999-11-02             86.0             4.454347
  #5  GW-04 1999-07-09            104.0             4.644391
  #6  GW-04 1999-09-14            102.0             4.624973
  #7  GW-04 1999-10-12             84.0             4.430817
  #8  GW-04 1999-11-15             72.0             4.276666
  #9  GW-08 1997-10-12             31.0             3.433987
  #10 GW-08 1997-11-16             84.0             4.430817
  #11 GW-08 1998-01-28             65.0             4.174387
  #12 GW-08 1999-04-20             41.0             3.713572
  #13 GW-08 2002-06-04             51.8             3.947390
  #14 GW-08 2002-09-16             57.5             4.051785
  #15 GW-08 2002-12-02             66.8             4.201703
  #16 GW-08 2003-03-24             87.1             4.467057
  #17 GW-09 1997-10-16             59.0             4.077537
  #18 GW-09 1998-01-28             85.0             4.442651
  #19 GW-09 1998-04-12             75.0             4.317488
  #20 GW-09 1998-07-12             99.0             4.595120
  #21 GW-09 2000-01-30             75.8             4.328098
  #22 GW-09 2000-04-24             82.5             4.412798
  #23 GW-09 2000-10-24             85.5             4.448516
  #24 GW-09 2002-12-01            188.0             5.236442
  #25 GW-09 2003-03-24            150.0             5.010635

  # The EPA guidance document constructs the upper simultaneous 
  # prediction limit for the 1-of-3 plan assuming a lognormal 
  # distribution for the sulfate data.  Here we will compare 
  # the value of the limit based on assuming a lognormal distribution 
  # versus assuming a gamma distribution.

  Sulfate <- EPA.09.Ex.19.1.sulfate.df$Sulfate.mg.per.l

  pred.int.list.lnorm <- 
    predIntLnormSimultaneous(x = Sulfate, k = 1, m = 3, r = 2, 
      rule = "k.of.m", pi.type = "upper", conf.level = conf.level)

  pred.int.list.gamma <- 
    predIntGammaSimultaneous(x = Sulfate, k = 1, m = 3, r = 2, 
      rule = "k.of.m", pi.type = "upper", conf.level = conf.level)


  pred.int.list.lnorm$interval$limits["UPL"]
  #     UPL 
  #159.5497

  pred.int.list.gamma$interval$limits["UPL"]
  #     UPL 
  #153.3232

  #==========

  # Cleanup
  #--------
  rm(dat, nc, nw, SWFPR, conf.level, Sulfate, pred.int.list.lnorm, 
    pred.int.list.gamma)



