library(EnvStats)


### Name: predIntNparSimultaneousN
### Title: Sample Size for Simultaneous Nonparametric Prediction Interval
###   for Continuous Distribution
### Aliases: predIntNparSimultaneousN
### Keywords: distribution design htest

### ** Examples

  # For the 1-of-2 rule, look at how the required sample size for a one-sided 
  # upper simultaneous nonparametric prediction interval for r=20 future 
  # sampling occasions increases with increasing confidence level:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  predIntNparSimultaneousN(r = 20, conf.level = seq(0.5, 0.9, by = 0.1)) 
  #[1]  4  5  7 10 17

  #----------

  # For the 1-of-m rule, look at how the required sample size for a one-sided 
  # upper simultaneous nonparametric prediction interval decreases with increasing 
  # number of future observations (m), given r=20 future sampling occasions:

  predIntNparSimultaneousN(k = 1, m = 1:5, r = 20) 
  #[1] 380  26  11   7   5

  #----------

  # For the 1-of-3 rule, look at how the required sample size for a one-sided 
  # upper simultaneous nonparametric prediction interval increases with number 
  # of future sampling occasions (r):

  predIntNparSimultaneousN(k = 1, m = 3, r = c(5, 10, 15, 20)) 
  #[1]  7  8 10 11

  #----------

  # For the 1-of-3 rule, look at how the required sample size for a one-sided 
  # upper simultaneous nonparametric prediction interval increases as the rank 
  # of the upper prediction limit decreases, given r=20 future sampling occasions:

  predIntNparSimultaneousN(k = 1, m = 3, r = 20, n.plus.one.minus.upl.rank = 1:5) 
  #[1] 11 19 26 34 41

  #----------

  # Compare the required sample size for r=20 future sampling occasions based 
  # on the 1-of-3 rule, the CA rule with m=3, and the Modified CA rule.

  predIntNparSimultaneousN(k = 1, m = 3, r = 20, rule = "k.of.m") 
  #[1] 11 

  predIntNparSimultaneousN(m = 3, r = 20, rule = "CA") 
  #[1] 36 

  predIntNparSimultaneousN(r = 20, rule = "Modified.CA") 
  #[1] 15

  #==========

  # Example 19-5 of USEPA (2009, p. 19-33) shows how to compute nonparametric upper 
  # simultaneous prediction limits for various rules based on trace mercury data (ppb) 
  # collected in the past year from a site with four background wells and 10 compliance 
  # wells (data for two of the compliance wells  are shown in the guidance document).  
  # The facility must monitor the 10 compliance wells for five constituents 
  # (including mercury) annually.
  
  # Here we will modify the example to compute the required number of background 
  # observations for two different sampling plans: 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the background maximum and 
  # 2) the 1-of-4 plan on individual observations using the 3rd highest background value.
  # The data for this example are stored in EPA.09.Ex.19.5.mercury.df.

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

  # nw = 10 Compliance Wells
  # nc =  5 Constituents
  # ne =  1 Evaluation per year

  nw <- 10
  nc <-  5
  ne <-  1

  # Set number of future sampling occasions r to 
  # Number Compliance Wells x Number Evaluations per Year
  r  <-  nw * ne

  conf.level <- (1 - 0.1)^(1 / nc)
  conf.level
  #[1] 0.9791484

  # So the required confidence level is 0.98, or 98%.

  # Now determine the required number of background observations for  each plan.
 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the 
  #    background maximum

  predIntNparSimultaneousN(n.median = 3, k = 1, m = 2, r = r, 
    conf.level = conf.level)
  #[1] 14


  # 2) the 1-of-4 plan on individual observations using the 3rd highest 
  #    background value.

  predIntNparSimultaneousN(k = 1, m = 4, r = r, 
    n.plus.one.minus.upl.rank = 3, conf.level = conf.level)
  #[1] 18

  #==========

  # Cleanup
  #--------
  rm(nw, nc, ne, r, conf.level) 



