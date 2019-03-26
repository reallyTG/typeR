library(EnvStats)


### Name: predIntNparSimultaneousConfLevel
### Title: Confidence Level of Simultaneous Nonparametric Prediction
###   Interval for Continuous Distribution
### Aliases: predIntNparSimultaneousConfLevel
### Keywords: distribution design htest

### ** Examples

  # For the 1-of-3 rule with r=20 future sampling occasions, look at how the 
  # confidence level of a simultaneous nonparametric prediction interval 
  # increases with increasing sample size:

  seq(5, 25, by = 5) 
  #[1] 5 10 15 20 25 

  conf <- predIntNparSimultaneousConfLevel(n = seq(5, 25, by = 5), 
    k = 1, m = 3, r = 20)
  round(conf, 2) 
  #[1] 0.82 0.95 0.98 0.99 0.99

  #----------

  # For the 1-of-m rule with r=20 future sampling occasions, look at how the 
  # confidence level of a simultaneous nonparametric prediction interval 
  # increases as the number of future observations increases:

  1:5
  #[1] 1 2 3 4 5

  conf <- predIntNparSimultaneousConfLevel(n = 10, k = 1, m = 1:5, r = 20)
  round(conf, 2) 
  #[1] 0.33 0.81 0.95 0.98 0.99

  #----------

  # For the 1-of-3 rule, look at how the confidence level of a simultaneous 
  # nonparametric prediction interval decreases with number of future sampling 
  # occasions (r):

  seq(5, 20, by = 5)
  #[1]  5 10 15 20

  conf <- predIntNparSimultaneousConfLevel(n = 10, k = 1, m = 3, 
    r = seq(5, 20, by = 5))

  round(conf, 2) 
  #[1] 0.98 0.97 0.96 0.95

  #----------

  # For the 1-of-3 rule with r=20 future sampling occasions, look at how the 
  # confidence level of a simultaneous nonparametric prediction interval 
  # decreases as the rank of the upper prediction limit decreases:

  conf <- predIntNparSimultaneousConfLevel(n = 10, k = 1, m = 3, r = 20, 
    n.plus.one.minus.upl.rank = 1:5)

  round(conf, 2) 
  #[1] 0.95 0.82 0.63 0.43 0.25

  #----------

  # Clean up
  #---------
  rm(conf)

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

  # So the required confidence level is 0.98, or 98%.
  # Now determine the confidence level associated with each plan.
  # Note that both plans achieve the required confidence level.
 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the 
  #    background maximum

  predIntNparSimultaneousConfLevel(n = 20, n.median = 3, k = 1, m = 2, r = r)
  #[1] 0.9940354


  # 2) the 1-of-4 plan on individual observations using the 3rd highest 
  #    background value.

  predIntNparSimultaneousConfLevel(n = 20, k = 1, m = 4, r = r, 
    n.plus.one.minus.upl.rank = 3)
  #[1] 0.9864909
 
  #==========

  # Cleanup
  #--------
  rm(n, nw, nc, ne, r, conf.level) 



