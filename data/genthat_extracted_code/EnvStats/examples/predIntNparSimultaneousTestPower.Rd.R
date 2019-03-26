library(EnvStats)


### Name: predIntNparSimultaneousTestPower
### Title: Probability That at Least One Set of Future Observations
###   Violates the Given Rule Based on a Nonparametric Simultaneous
###   Prediction Interval
### Aliases: predIntNparSimultaneousTestPower
### Keywords: distribution htest

### ** Examples

  # Example 19-5 of USEPA (2009, p. 19-33) shows how to compute nonparametric upper 
  # simultaneous prediction limits for various rules based on trace mercury data (ppb) 
  # collected in the past year from a site with four background wells and 10 compliance 
  # wells (data for two of the compliance wells  are shown in the guidance document).  
  # The facility must monitor the 10 compliance wells for five constituents 
  # (including mercury) annually.
  
  # Here we will compute the confidence levels and powers associated with  
  # two different sampling plans: 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the 
  #    background maximum and 
  # 2) the 1-of-4 plan on individual observations using the 3rd highest 
  #    background value.
  # Power will be computed assuming a normal distribution and setting 
  # delta.over.sigma equal to 2, 3, and 4.
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


  # 2) the 1-of-4 plan based on individual observations using the 3rd highest 
  #    background value.

  predIntNparSimultaneousConfLevel(n = 20, k = 1, m = 4, r = r, 
    n.plus.one.minus.upl.rank = 3)
  #[1] 0.9864909

  #------------------------------------------------------------------------------
  # Compute approximate power of each plan to detect contamination at just 1 well 
  # assuming true underying distribution of Hg is Normal at all wells and 
  # using delta.over.sigma equal to 2, 3, and 4.
  #------------------------------------------------------------------------------

  # Computer aproximate power for 
  # 1) the 1-of-2 retesting plan for a median of order 3 using the 
  #    background maximum

  predIntNparSimultaneousTestPower(n = 20, n.median = 3, k = 1, m = 2, r = r, 
    delta.over.sigma = 2:4, r.shifted = 1)
  #[1] 0.3953712 0.9129671 0.9983054


  # Compute approximate power for
  # 2) the 1-of-4 plan based on individual observations using the 3rd highest 
  #    background value.

  predIntNparSimultaneousTestPower(n = 20, k = 1, m = 4, r = r, 
    n.plus.one.minus.upl.rank = 3, delta.over.sigma = 2:4, r.shifted = 1)
  #[1] 0.4367972 0.8694664 0.9888779


  #----------

  ## Not run: 
##D   # Compare estimated power using approximation method with estimated power
##D   # using Monte Carlo simulation for the 1-of-4 plan based on individual 
##D   # observations using the 3rd highest background value.
##D 
##D   predIntNparSimultaneousTestPower(n = 20, k = 1, m = 4, r = r, 
##D     n.plus.one.minus.upl.rank = 3, delta.over.sigma = 2:4, r.shifted = 1, 
##D     method = "simulate", ci = TRUE, NMC = 1000)
##D   #[1] 0.437 0.863 0.989
##D   #attr(,"conf.int")
##D   #         [,1]      [,2]      [,3]
##D   #LCL 0.4111999 0.8451148 0.9835747
##D   #UCL 0.4628001 0.8808852 0.9944253
##D   
## End(Not run)
 
  #==========

  # Cleanup
  #--------
  rm(n, nw, nc, ne, r, conf.level) 



