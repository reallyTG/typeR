library(EnvStats)


### Name: eqnpar
### Title: Estimate Quantiles of a Distribution Nonparametrically
### Aliases: eqnpar
### Keywords: distribution htest

### ** Examples


  # The data frame ACE.13.TCE.df contains observations on 
  # Trichloroethylene (TCE) concentrations (mg/L) at 
  # 10 groundwater monitoring wells before and after remediation.  
  #
  # Compute the median concentration for each period along with 
  # a 95% confidence interval for the median.
  #
  # Before remediation:  20.3 [8.8, 35.9]
  # After  remediation:   2.5 [0.8,  5.9]

  with(ACE.13.TCE.df, 
    eqnpar(TCE.mg.per.L[Period=="Before"], ci = TRUE))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------

  #Assumed Distribution:            None

  #Estimated Quantile(s):           Median = 20.3

  #Quantile Estimation Method:      Nonparametric

  #Data:                            TCE.mg.per.L[Period == "Before"]

  #Sample Size:                     10

  #Confidence Interval for:         50'th %ile

  #Confidence Interval Method:      interpolate (Nyblom, 1992)

  #Confidence Interval Type:        two-sided

  #Confidence Level:                95%

  #Confidence Limit Rank(s):        2 9 
  #                                 3 8 

  #Confidence Interval:             LCL =  8.804775
  #                                 UCL = 35.874775

  #----------

  with(ACE.13.TCE.df, eqnpar(TCE.mg.per.L[Period=="After"], ci = TRUE))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------

  #Assumed Distribution:            None

  #Estimated Quantile(s):           Median = 2.48

  #Quantile Estimation Method:      Nonparametric

  #Data:                            TCE.mg.per.L[Period == "After"]

  #Sample Size:                     10

  #Confidence Interval for:         50'th %ile

  #Confidence Interval Method:      interpolate (Nyblom, 1992)

  #Confidence Interval Type:        two-sided

  #Confidence Level:                95%

  #Confidence Limit Rank(s):        2 9 
  #                                 3 8 

  #Confidence Interval:             LCL = 0.7810901
  #                                 UCL = 5.8763063

  #==========

  # Generate 20 observations from a cauchy distribution with parameters 
  # location=0, scale=1.  The true 75th percentile of this distribution is 1. 
  # Use eqnpar to estimate the 75th percentile and construct a 90% confidence interval. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rcauchy(20, location = 0, scale = 1) 

  #-------------------------------------------------------
  # First, use the default method, ci.method="interpolate"
  #-------------------------------------------------------

  eqnpar(dat, p = 0.75, ci = TRUE, approx.conf.level = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           75'th %ile = 1.524903
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         75'th %ile
  #
  #Confidence Interval Method:      interpolate (Nyblom, 1992)
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                90%
  #
  #Confidence Limit Rank(s):        12 19 
  #                                 13 18 
  #
  #Confidence Interval:             LCL = 0.8191423
  #                                 UCL = 2.1215570

  #----------

  #-------------------------------------------------------------
  # Now use ci.method="exact".  
  # Note that the returned confidence level is greater than 90%.
  #-------------------------------------------------------------

  eqnpar(dat, p = 0.75, ci = TRUE, approx.conf.level = 0.9, 
    ci.method = "exact") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           75'th %ile = 1.524903
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         75'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                93.47622%
  #
  #Confidence Limit Rank(s):        12 19 
  #
  #Confidence Interval:             LCL = 0.7494692
  #                                 UCL = 2.2156601

  #----------

  #----------------------------------------------------------
  # Now use ci.method="exact" with min.coverage=FALSE.  
  # Note that the returned confidence level is less than 90%.
  #----------------------------------------------------------

  eqnpar(dat, p = 0.75, ci = TRUE, approx.conf.level = 0.9, 
    ci.method = "exact", min.coverage = FALSE, ) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           75'th %ile = 1.524903
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         75'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                89.50169%
  #
  #Confidence Limit Rank(s):        13 20 
  #
  #Confidence Interval:             LCL = 1.018038
  #                                 UCL = 5.002399

  #----------

  #-----------------------------------------------------------
  # Now supply our own bounds for the confidence interval.  
  # The first example above based on the Interpolate method 
  # used lcl.rank=12, ucl.rank=19 and lcl.rank=13, ucl.rank=18 
  # and interpolated between these two confidence intervals.  
  # Here we will specify lcl.rank=13 and ucl.rank=18.  The 
  # resulting confidence level is 81%.  
  #-----------------------------------------------------------

  eqnpar(dat, p = 0.75, ci = TRUE, lcl.rank = 13, ucl.rank = 18) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           75'th %ile = 1.524903
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         75'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                80.69277%
  #
  #Confidence Limit Rank(s):        13 18 
  #
  #Confidence Interval:             LCL = 1.018038
  #                                 UCL = 2.071172

  #----------

  # Clean up
  rm(dat)

  #==========

  # Modify Example 17-4 on page 17-21 of USEPA (2009).  This example uses 
  # copper concentrations (ppb) from 3 background wells to set an upper 
  # limit for 2 compliance wells.  Here we will attempt to compute an upper 
  # 95% confidence interval for the 95'th percentile of the distribution of 
  # copper concentrations in the background wells.  
  #
  # The data are stored in EPA.92c.copper2.df.  
  #
  # Note that even though these data are Type I left singly censored, 
  # it is still possible to compute an estimate of the 95'th percentile. 

  EPA.92c.copper2.df
  #   Copper.orig Copper Censored Month Well  Well.type
  #1           <5    5.0     TRUE     1    1 Background
  #2           <5    5.0     TRUE     2    1 Background
  #3          7.5    7.5    FALSE     3    1 Background
  #...
  #9          9.2    9.2    FALSE     1    2 Background
  #10          <5    5.0     TRUE     2    2 Background
  #11          <5    5.0     TRUE     3    2 Background
  #...
  #17          <5    5.0     TRUE     1    3 Background
  #18         5.4    5.4    FALSE     2    3 Background
  #19         6.7    6.7    FALSE     3    3 Background
  #...
  #29         6.2    6.2    FALSE     5    4 Compliance
  #30          <5    5.0     TRUE     6    4 Compliance
  #31         7.8    7.8    FALSE     7    4 Compliance
  #...
  #38          <5    5.0     TRUE     6    5 Compliance
  #39         5.6    5.6    FALSE     7    5 Compliance
  #40          <5    5.0     TRUE     8    5 Compliance

  # Because of the small sample size of n=24 observations, it is not possible 
  # to create a nonparametric confidence interval for the 95th percentile 
  # that has an associated confidence level of 95%.  If we tried to do this, 
  # we would get an error message:

  # with(EPA.92c.copper2.df, 
  #    eqnpar(Copper[Well.type=="Background"], p = 0.95, ci = TRUE, lb = 0, 
  #      ci.type = "upper", approx.conf.level = 0.95)) 
  #
  #Error in ci.qnpar.interpolate(x = c(5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,  : 
  #  Minimum coverage of 0.95 is not possible with the given sample size.

  # So instead, we will use ci.method="exact" with min.coverage=FALSE 
  # to construct the confidence interval.  Note that the associated 
  # confidence level is only 71%.

  with(EPA.92c.copper2.df, 
     eqnpar(Copper[Well.type=="Background"], p = 0.95, ci = TRUE, 
        ci.method = "exact", min.coverage = FALSE, 
        ci.type = "upper", lb = 0, 
        approx.conf.level = 0.95)) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           95'th %ile = 7.925
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            Copper[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                70.8011%
  #
  #Confidence Limit Rank(s):        NA 24 
  #
  #Confidence Interval:             LCL = 0.0
  #                                 UCL = 9.2

  #----------

  # For the above example, the true confidence level is 71% instead of 95%.  
  # This is a function of the small sample size.  In fact, as Example 17-4 on 
  # pages 17-21 of USEPA (2009) shows, the largest quantile for which you can 
  # construct a nonparametric confidence interval that will have associated 
  # confidence level of 95% is the 88'th percentile:

  with(EPA.92c.copper2.df, 
    eqnpar(Copper[Well.type=="Background"], p = 0.88, ci = TRUE, 
      ci.type = "upper", lb = 0, ucl.rank = 24, 
      approx.conf.level = 0.95)) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           88'th %ile = 6.892
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            Copper[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Confidence Interval for:         88'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95.3486%
  #
  #Confidence Limit Rank(s):        NA 24 
  #
  #Confidence Interval:             LCL = 0.0
  #                                 UCL = 9.2

  #==========

  # Reproduce Example 21-6 on pages 21-21 to 21-22 of USEPA (2009).  
  # Use 12 measurements of nitrate (mg/L) at a well used for drinking water 
  # to determine with 95% confidence whether or not the infant-based, acute 
  # risk standard of 10 mg/L has been violated.  Assume that the risk 
  # standard represents an upper 95'th percentile limit on nitrate 
  # concentrations.  So what we need to do is construct a one-sided 
  # lower nonparametric confidence interval for the 95'th percentile 
  # that has associated confidence level of no more than 95%, and we will 
  # compare the lower confidence limit with the MCL of 10 mg/L.  
  #
  # The data for this example are stored in EPA.09.Ex.21.6.nitrate.df.

  # Look at the data:
  #------------------

  EPA.09.Ex.21.6.nitrate.df
  #   Sampling.Date       Date Nitrate.mg.per.l.orig Nitrate.mg.per.l Censored
  #1      7/28/1999 1999-07-28                  <5.0              5.0     TRUE
  #2       9/3/1999 1999-09-03                  12.3             12.3    FALSE
  #3     11/24/1999 1999-11-24                  <5.0              5.0     TRUE
  #4       5/3/2000 2000-05-03                  <5.0              5.0     TRUE
  #5      7/14/2000 2000-07-14                   8.1              8.1    FALSE
  #6     10/31/2000 2000-10-31                  <5.0              5.0     TRUE
  #7     12/14/2000 2000-12-14                    11             11.0    FALSE
  #8      3/27/2001 2001-03-27                  35.1             35.1    FALSE
  #9      6/13/2001 2001-06-13                  <5.0              5.0     TRUE
  #10     9/16/2001 2001-09-16                  <5.0              5.0     TRUE
  #11    11/26/2001 2001-11-26                   9.3              9.3    FALSE
  #12      3/2/2002 2002-03-02                  10.3             10.3    FALSE

  # Determine what order statistic to use for the lower confidence limit
  # in order to achieve no more than 95% confidence.
  #---------------------------------------------------------------------

  conf.levels <- ciNparConfLevel(n = 12, p = 0.95, lcl.rank = 1:12, 
    ci.type = "lower")
  names(conf.levels) <- 1:12

  round(conf.levels, 2)
  #   1    2    3    4    5    6    7    8    9   10   11   12 
  #1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 1.00 0.98 0.88 0.54 
  
  # Using the 11'th largest observation for the lower confidence limit 
  # yields a confidence level of 88%.  Using the 10'th largest 
  # observation yields a confidence level of 98%.  The example in 
  # USEPA (2009) uses the 10'th largest observation.
  #
  # The 10'th largest observation is 11 mg/L which exceeds the 
  # MCL of 10 mg/L, so there is evidence of contamination.
  #--------------------------------------------------------------------

  with(EPA.09.Ex.21.6.nitrate.df, 
    eqnpar(Nitrate.mg.per.l, p = 0.95, ci = TRUE, 
      ci.type = "lower", lcl.rank = 10))

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Estimated Quantile(s):           95'th %ile = 22.56
  #
  #Quantile Estimation Method:      Nonparametric
  #
  #Data:                            Nitrate.mg.per.l
  #
  #Sample Size:                     12
  #
  #Confidence Interval for:         95'th %ile
  #
  #Confidence Interval Method:      exact
  #
  #Confidence Interval Type:        lower
  #
  #Confidence Level:                98.04317%
  #
  #Confidence Limit Rank(s):        10 NA 
  #
  #Confidence Interval:             LCL =  11
  #                                 UCL = Inf

  #==========

  # Clean up
  #---------
 
  rm(conf.levels)



