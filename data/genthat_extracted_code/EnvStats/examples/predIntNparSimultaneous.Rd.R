library(EnvStats)


### Name: predIntNparSimultaneous
### Title: Nonparametric Simultaneous Prediction Interval for a Continuous
###   Distribution
### Aliases: predIntNparSimultaneous 'Nonparametric Simultaneous Prediction
###   Interval'
### Keywords: distribution design htest

### ** Examples

  # Generate 20 observations from a lognormal mixture distribution with 
  # parameters mean1=1, cv1=0.5, mean2=5, cv2=1, and p.mix=0.1.  Use 
  # predIntNparSimultaneous to construct an upper one-sided prediction interval 
  # using the maximum observed value using the 1-of-3 rule.  
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormMixAlt(n = 20, mean1 = 1, cv1 = 0.5, 
    mean2 = 5, cv2 = 1, p.mix = 0.1) 

  predIntNparSimultaneous(dat, k = 1, m = 3, lb = 0) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      exact 
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                99.94353%
  #
  #Prediction Limit Rank(s):        20 
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain:         1
  #
  #Total Number of
  #Future Observations:             3
  #
  #Prediction Interval:             LPL = 0.000000
  #                                 UPL = 1.817311

  #----------

  # Compare the confidence levels for the 1-of-3 rule, California Rule, and 
  # Modified California Rule.

  predIntNparSimultaneous(dat, k = 1, m = 3, lb = 0)$interval$conf.level
  #[1] 0.9994353

  predIntNparSimultaneous(dat, m = 3, rule = "CA", lb = 0)$interval$conf.level
  #[1] 0.9919066

  predIntNparSimultaneous(dat, rule = "Modified.CA", lb = 0)$interval$conf.level
  #[1] 0.9984943

  #=========

  # Repeat the above example, but create the baseline data using just 
  # n=8 observations and set r to 4 future sampling occasions

  set.seed(598) 
  dat <- rlnormMixAlt(n = 8, mean1 = 1, cv1 = 0.5, 
    mean2 = 5, cv2 = 1, p.mix = 0.1) 

  predIntNparSimultaneous(dat, k = 1, m = 3, r = 4, lb = 0) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            dat
  #
  #Sample Size:                     8
  #
  #Prediction Interval Method:      exact 
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                97.7599%
  #
  #Prediction Limit Rank(s):        8 
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain
  #(per Sampling Occasion):         1
  #
  #Total Number of
  #Future Observations
  #(per Sampling Occasion):         3
  #
  #Number of Future
  #Sampling Occasions:              4
  #
  #Prediction Interval:             LPL = 0.000000
  #                                 UPL = 5.683453

  #----------

  # Compare the confidence levels for the 1-of-3 rule, California Rule, and 
  # Modified California Rule.

  predIntNparSimultaneous(dat, k = 1, m = 3, r = 4, lb = 0)$interval$conf.level
  #[1] 0.977599

  predIntNparSimultaneous(dat, m = 3, r = 4, rule = "CA", lb = 0)$interval$conf.level
  #[1] 0.8737798

  predIntNparSimultaneous(dat, r = 4, rule = "Modified.CA", lb = 0)$interval$conf.level
  #[1] 0.9510178

  #==========

  # Example 19-5 of USEPA (2009, p. 19-33) shows how to compute nonparametric upper 
  # simultaneous prediction limits for various rules based on trace mercury data (ppb) 
  # collected in the past year from a site with four background wells and 10 compliance 
  # wells (data for two of the compliance wells  are shown in the guidance document).  
  # The facility must monitor the 10 compliance wells for five constituents 
  # (including mercury) annually.
  
  # Here we will compute the confidence level associated with two different sampling plans: 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the background maximum and 
  # 2) the 1-of-4 plan on individual observations using the 3rd highest background value.
  # The data for this example are stored in EPA.09.Ex.19.5.mercury.df.

  # We will pool data from 4 background wells that were sampled on 
  # a number of different occasions, giving us a sample size of 
  # n = 20 to use to construct the prediction limit.

  # There are 10 compliance wells and we will monitor 5 different 
  # constituents at each well annually.  For this example, USEPA (2009) 
  # recommends setting r to the product of the number of compliance wells and 
  # the number of evaluations per year.  

  # To determine the minimum confidence level we require for 
  # the simultaneous prediction interval, USEPA (2009) recommends 
  # setting the maximum allowed individual Type I Error level per constituent to:
 
  # 1 - (1 - SWFPR)^(1 / Number of Constituents)
  
  # which translates to setting the confidence limit to 

  # (1 - SWFPR)^(1 / Number of Constituents)

  # where SWFPR = site-wide false positive rate.  For this example, we 
  # will set SWFPR = 0.1.  Thus, the required individual Type I Error level 
  # and confidence level per constituent are given as follows:

  # n  = 20 based on 4 Background Wells
  # nw = 10 Compliance Wells
  # nc =  5 Constituents
  # ne =  1 Evaluation per year

  n  <- 20
  nw <- 10
  nc <-  5
  ne <-  1

  # Set number of future sampling occasions r to 
  # Number Compliance Wells x Number Evaluations per Year
  r  <-  nw * ne

  conf.level <- (1 - 0.1)^(1 / nc)
  conf.level
  #[1] 0.9791484

  alpha <- 1 - conf.level
  alpha
  #[1] 0.02085164

  #----------

  # Look at the data:

  head(EPA.09.Ex.19.5.mercury.df)
  #  Event Well  Well.type Mercury.ppb.orig Mercury.ppb Censored
  #1     1 BG-1 Background             0.21        0.21    FALSE
  #2     2 BG-1 Background              <.2        0.20     TRUE
  #3     3 BG-1 Background              <.2        0.20     TRUE
  #4     4 BG-1 Background              <.2        0.20     TRUE
  #5     5 BG-1 Background              <.2        0.20     TRUE
  #6     6 BG-1 Background                           NA    FALSE

  longToWide(EPA.09.Ex.19.5.mercury.df, "Mercury.ppb.orig", 
    "Event", "Well", paste.row.name = TRUE)
  #        BG-1 BG-2 BG-3 BG-4 CW-1 CW-2
  #Event.1 0.21  <.2  <.2  <.2 0.22 0.36
  #Event.2  <.2  <.2 0.23 0.25  0.2 0.41
  #Event.3  <.2  <.2  <.2 0.28  <.2 0.28
  #Event.4  <.2 0.21 0.23  <.2 0.25 0.45
  #Event.5  <.2  <.2 0.24  <.2 0.24 0.43
  #Event.6                      <.2 0.54


  # Construct the upper simultaneous prediction limit using the 1-of-2  
  # retesting plan for a median of order 3 based on the background maximum 

  Hg.Back <- with(EPA.09.Ex.19.5.mercury.df, 
    Mercury.ppb[Well.type == "Background"])

  pred.int.1.of.2.med.3 <- predIntNparSimultaneous(Hg.Back, n.median = 3, 
    k = 1, m = 2, r = r, lb = 0)

  pred.int.1.of.2.med.3

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            Hg.Back
  #
  #Sample Size:                     20
  #
  #Number NA/NaN/Inf's:             4
  #
  #Prediction Interval Method:      exact 
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                99.40354%
  #
  #Prediction Limit Rank(s):        20 
  #
  #Minimum Number of
  #Future Medians
  #Interval Should Contain
  #(per Sampling Occasion):         1
  #
  #Total Number of
  #Future Medians
  #(per Sampling Occasion):         2
  #
  #Number of Future
  #Sampling Occasions:              10
  #
  #Sample Size for Medians:         3
  #
  #Prediction Interval:             LPL = 0.00
  #                                 UPL = 0.28

  # Note that the achieved confidence level of 99.4% is greater than the 
  # required confidence level of 97.9%.

  # Now determine whether either compliance well indicates evidence of 
  # Mercury contamination.

  # Compliance Well 1
  #------------------
  Hg.CW.1 <- with(EPA.09.Ex.19.5.mercury.df, Mercury.ppb.orig[Well == "CW-1"])

  Hg.CW.1
  #[1] "0.22" "0.2"  "<.2"  "0.25" "0.24" "<.2"

  # The median of the first 3 observations is 0.2, which is less than 
  # the UPL of 0.28, so there is no evidence of contamination.

  # Compliance Well 2
  #------------------
  Hg.CW.2 <- with(EPA.09.Ex.19.5.mercury.df, Mercury.ppb.orig[Well == "CW-2"])

  Hg.CW.2
  #[1] "0.36" "0.41" "0.28" "0.45" "0.43" "0.54"

  # The median of the first 3 observations is 0.36, so 3 more observations have to 
  # be looked at.  The median of the second 3 observations is 0.45, which is 
  # larger than the UPL of 0.28, so there is evidence of contamination.  

  #----------

  # Now create the upper simultaneous prediction limit using the 1-of-4 plan 
  # on individual observations using the 3rd highest background value.

  pred.int.1.of.4.3rd <- predIntNparSimultaneous(Hg.Back, k = 1, m = 4, 
    r = r, lb = 0, n.plus.one.minus.upl.rank = 3)

  pred.int.1.of.4.3rd  

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            Hg.Back
  #
  #Sample Size:                     20
  #
  #Number NA/NaN/Inf's:             4
  #
  #Prediction Interval Method:      exact 
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                98.64909%
  #
  #Prediction Limit Rank(s):        18 
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain
  #(per Sampling Occasion):         1
  #
  #Total Number of
  #Future Observations
  #(per Sampling Occasion):         4
  #
  #Number of Future
  #Sampling Occasions:              10
  #
  #Prediction Interval:             LPL = 0.00
  #                                 UPL = 0.24

  # Note that the achieved confidence level of 98.6% is greater than the 
  # required confidence level of 97.9%.


  # Now determine whether either compliance well indicates evidence of 
  # Mercury contamination.

  # Compliance Well 1
  #------------------
  Hg.CW.1 <- with(EPA.09.Ex.19.5.mercury.df, Mercury.ppb.orig[Well == "CW-1"])

  Hg.CW.1
  #[1] "0.22" "0.2"  "<.2"  "0.25" "0.24" "<.2"

  # The first observation is less than the UPL of 0.24, which is less than 
  # the UPL of 0.28, so there is no evidence of contamination.


  # Compliance Well 2
  #------------------
  Hg.CW.2 <- with(EPA.09.Ex.19.5.mercury.df, Mercury.ppb.orig[Well == "CW-2"])

  Hg.CW.2
  #[1] "0.36" "0.41" "0.28" "0.45" "0.43" "0.54"

  # All of the first 4 observations are greater than the UPL of 0.24, so there 
  # is evidence of contamination.  

   #==========

  # Cleanup
  #--------
  rm(dat, n, nw, nc, ne, r, conf.level, alpha, Hg.Back, pred.int.1.of.2.med.3, 
    pred.int.1.of.4.3rd, Hg.CW.1, Hg.CW.2)



