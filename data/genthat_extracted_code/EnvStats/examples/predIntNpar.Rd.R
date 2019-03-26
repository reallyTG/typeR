library(EnvStats)


### Name: predIntNpar
### Title: Nonparametric Prediction Interval for a Continuous Distribution
### Aliases: predIntNpar 'Nonparametric Prediction Interval'
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal mixture distribution with 
  # parameters mean1=1, cv1=0.5, mean2=5, cv2=1, and p.mix=0.1.  Use 
  # predIntNpar to construct a two-sided prediction interval using the 
  # minimum and maximum observed values.  Note that the associated confidence 
  # level is 90%.  A larger sample size is required to obtain a larger 
  # confidence level (see the help file for predIntNparN). 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormMixAlt(n = 20, mean1 = 1, cv1 = 0.5, 
    mean2 = 5, cv2 = 1, p.mix = 0.1) 

  predIntNpar(dat) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      Exact
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                90.47619%
  #
  #Prediction Limit Rank(s):        1 20 
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL = 0.3647875
  #                                 UPL = 1.8173115

  #----------

  # Repeat the above example, but specify m=5 future observations should be 
  # contained in the prediction interval.  Note that the confidence level is 
  # now only 63%.

  predIntNpar(dat, m = 5) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      Exact
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                63.33333%
  #
  #Prediction Limit Rank(s):        1 20 
  #
  #Number of Future Observations:   5
  #
  #Prediction Interval:             LPL = 0.3647875
  #                                 UPL = 1.8173115

  #----------

  # Repeat the above example, but specify that a minimum of k=3 observations 
  # out of a total of m=5 future observations should be contained in the 
  # prediction interval.  Note that the confidence level is now 98%.

  predIntNpar(dat, k = 3, m = 5) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      Exact
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                98.37945%
  #
  #Prediction Limit Rank(s):        1 20 
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain:         3
  #
  #Total Number of
  #Future Observations:             5
  #
  #Prediction Interval:             LPL = 0.3647875
  #                                 UPL = 1.8173115

  #==========

  # Example 18-3 of USEPA (2009, p.18-19) shows how to construct 
  # a one-sided upper nonparametric prediction interval for the next 
  # 4 future observations of trichloroethylene (TCE) at a downgradient well.  
  # The data for this example are stored in EPA.09.Ex.18.3.TCE.df.  
  # There are 6 monthly observations of TCE (ppb) at 3 background wells, 
  # and 4 monthly observations of TCE at a compliance well.

  # Look at the data
  #-----------------

  EPA.09.Ex.18.3.TCE.df

  #   Month Well  Well.type TCE.ppb.orig TCE.ppb Censored
  #1      1 BW-1 Background           <5     5.0     TRUE
  #2      2 BW-1 Background           <5     5.0     TRUE
  #3      3 BW-1 Background            8     8.0    FALSE
  #...
  #22     4 CW-4 Compliance           <5     5.0     TRUE
  #23     5 CW-4 Compliance            8     8.0    FALSE
  #24     6 CW-4 Compliance           14    14.0    FALSE


  longToWide(EPA.09.Ex.18.3.TCE.df, "TCE.ppb.orig", "Month", "Well", 
    paste.row.name = TRUE)

  #        BW-1 BW-2 BW-3 CW-4
  #Month.1   <5    7   <5     
  #Month.2   <5  6.5   <5     
  #Month.3    8   <5 10.5  7.5
  #Month.4   <5    6   <5   <5
  #Month.5    9   12   <5    8
  #Month.6   10   <5    9   14


  # Construct the prediction limit based on the background well data 
  # using the maximum value as the upper prediction limit.  
  # Note that since all censored observations are censored at one 
  # censoring level and the censoring level is less than all of the 
  # uncensored observations, we can just supply the censoring level 
  # to predIntNpar.
  #-----------------------------------------------------------------

  with(EPA.09.Ex.18.3.TCE.df, 
    predIntNpar(TCE.ppb[Well.type == "Background"], 
      m = 4, pi.type = "upper", lb = 0))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            TCE.ppb[Well.type == "Background"]
  #
  #Sample Size:                     18
  #
  #Prediction Interval Method:      Exact
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                81.81818%
  #
  #Prediction Limit Rank(s):        18 
  #
  #Number of Future Observations:   4
  #
  #Prediction Interval:             LPL =  0
  #                                 UPL = 12

  # Since the value of 14 ppb for Month 6 at the compliance well exceeds 
  # the upper prediction limit of 12, we might conclude that there is 
  # statistically significant evidence of an increase over background 
  # at CW-4.  However, the confidence level associated with this 
  # prediction limit is about 82%, which implies a Type I error level of 
  # 18%.  This means there is nearly a one in five chance of a false positive. 
  # Only additional background data and/or use of a retesting strategy 
  # (see predIntNparSimultaneous) would lower the false positive rate.

  #==========

  # Example 18-4 of USEPA (2009, p.18-19) shows how to construct 
  # a one-sided upper nonparametric prediction interval for the next 
  # median of order 3 of xylene at a downgradient well.  
  # The data for this example are stored in EPA.09.Ex.18.4.xylene.df.  
  # There are 8 monthly observations of xylene (ppb) at 3 background wells, 
  # and 3 montly observations of TCE at a compliance well.

  # Look at the data
  #-----------------

  EPA.09.Ex.18.4.xylene.df

  #   Month   Well  Well.type Xylene.ppb.orig Xylene.ppb Censored
  #1      1 Well.1 Background              <5        5.0     TRUE
  #2      2 Well.1 Background              <5        5.0     TRUE
  #3      3 Well.1 Background             7.5        7.5    FALSE
  #...
  #30     6 Well.4 Compliance              <5        5.0     TRUE
  #31     7 Well.4 Compliance             7.8        7.8    FALSE
  #32     8 Well.4 Compliance            10.4       10.4    FALSE

  longToWide(EPA.09.Ex.18.4.xylene.df, "Xylene.ppb.orig", "Month", "Well", 
    paste.row.name = TRUE)

  #        Well.1 Well.2 Well.3 Well.4
  #Month.1     <5    9.2     <5       
  #Month.2     <5     <5    5.4       
  #Month.3    7.5     <5    6.7       
  #Month.4     <5    6.1     <5       
  #Month.5     <5      8     <5       
  #Month.6     <5    5.9     <5     <5
  #Month.7    6.4     <5     <5    7.8
  #Month.8      6     <5     <5   10.4

  # Construct the prediction limit based on the background well data 
  # using the maximum value as the upper prediction limit. 
  # Note that since all censored observations are censored at one 
  # censoring level and the censoring level is less than all of the 
  # uncensored observations, we can just supply the censoring level 
  # to predIntNpar.
  #
  # To compute a prediction interval for a median of order 3 (i.e., 
  # a median based on 3 observations), this is equivalent to 
  # constructing a nonparametric prediction interval that must hold 
  # at least 2 of the next 3 future observations.
  #-----------------------------------------------------------------

  with(EPA.09.Ex.18.4.xylene.df, 
    predIntNpar(Xylene.ppb[Well.type == "Background"], 
      k = 2, m = 3, pi.type = "upper", lb = 0))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            Xylene.ppb[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Prediction Interval Method:      Exact
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                99.1453%
  #
  #Prediction Limit Rank(s):        24 
  #
  #Minimum Number of
  #Future Observations
  #Interval Should Contain:         2
  #
  #Total Number of
  #Future Observations:             3
  #
  #Prediction Interval:             LPL = 0.0
  #                                 UPL = 9.2

  # The Month 8 observation at the Complance well is 10.4 ppb of Xylene, 
  # which is greater than the upper prediction limit of 9.2 ppb, so
  # conclude there is evidence of contamination at the 
  # 100% - 99% = 1% Type I Error Level

  #==========

  # Cleanup
  #--------

  rm(dat)



