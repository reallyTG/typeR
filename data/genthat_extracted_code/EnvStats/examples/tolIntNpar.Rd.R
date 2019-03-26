library(EnvStats)


### Name: tolIntNpar
### Title: Nonparametric Tolerance Interval for a Continuous Distribution
### Aliases: tolIntNpar
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a lognormal mixture distribution
  # with parameters mean1=1, cv1=0.5, mean2=5, cv2=1, and p.mix=0.1.  
  # The exact two-sided interval that contains 90% of this distribution is given by: 
  # [0.682312, 13.32052].  Use tolIntNpar to construct a two-sided 90% 
  # \eqn{\beta}-content tolerance interval.  Note that the associated confidence level 
  # is only 61%.  A larger sample size is required to obtain a larger confidence 
  # level (see the help file for tolIntNparN). 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(23) 
  dat <- rlnormMixAlt(20, 1, 0.5, 5, 1, 0.1) 
  tolIntNpar(dat, coverage = 0.9) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
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
  #Confidence Level:                60.8253%
  #
  #Tolerance Limit Rank(s):         1 20 
  #
  #Tolerance Interval:              LTL = 0.5035035
  #                                 UTL = 9.9504662

  #----------

  # Clean up
  rm(dat)

  #----------

  # Reproduce Example 17-4 on page 17-21 of USEPA (2009).  This example uses 
  # copper concentrations (ppb) from 3 background wells to set an upper 
  # limit for 2 compliance wells.  The maximum value from the 3 wells is set 
  # to the 95% confidence upper tolerance limit, and we need to determine the 
  # coverage of this tolerance interval.  The data are stored in EPA.92c.copper2.df.  
  # Note that even though these data are Type I left singly censored, it is still 
  # possible to compute an upper tolerance interval using any of the uncensored 
  # observations as the upper limit. 

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

  with(EPA.92c.copper2.df, 
    tolIntNpar(Copper[Well.type=="Background"], 
      conf.level = 0.95, lb = 0, ti.type = "upper")) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            Copper[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Tolerance Interval Coverage:     88.26538%
  #
  #Coverage Type:                   content
  #
  #Tolerance Interval Method:       Exact
  #
  #Tolerance Interval Type:         upper
  #
  #Confidence Level:                95%
  #
  #Tolerance Limit Rank(s):         24 
  #
  #Tolerance Interval:              LTL = 0.0
  #                                 UTL = 9.2

  #----------

  # Repeat the last example, except compute an upper 
  # \eqn{\beta}-expectation tolerance interval:

  with(EPA.92c.copper2.df, 
    tolIntNpar(Copper[Well.type=="Background"], 
      cov.type = "expectation", lb = 0, ti.type = "upper")) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            None
  #
  #Data:                            Copper[Well.type == "Background"]
  #
  #Sample Size:                     24
  #
  #Tolerance Interval Coverage:     96%
  #
  #Coverage Type:                   expectation
  #
  #Tolerance Interval Method:       Exact
  #
  #Tolerance Interval Type:         upper
  #
  #Tolerance Limit Rank(s):         24 
  #
  #Tolerance Interval:              LTL = 0.0
  #                                 UTL = 9.2



