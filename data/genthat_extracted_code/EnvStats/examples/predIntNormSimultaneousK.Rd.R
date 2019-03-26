library(EnvStats)


### Name: predIntNormSimultaneousK
### Title: Compute the Value of K for a Simultaneous Prediction Interval
###   for a Normal Distribution
### Aliases: predIntNormSimultaneousK
### Keywords: distribution htest

### ** Examples

  # Compute the value of K for an upper 95% simultaneous prediction 
  # interval to contain at least 1 out of the next 3 observations 
  # given a background sample size of n=8.

  predIntNormSimultaneousK(n = 8, k = 1, m = 3)
  #[1] 0.5123091

  #----------

  # Compare the value of K for a 95% 1-of-3 upper prediction interval to 
  # the value for the California and Modified California rules.  
  # Note that the value of K for the Modified California rule is between 
  # the value of K for the 1-of-3 rule and the California rule. 

  predIntNormSimultaneousK(n = 8, k = 1, m = 3) 
  #[1] 0.5123091 
 
  predIntNormSimultaneousK(n = 8, m = 3, rule = "CA")
  #[1] 1.252077

  predIntNormSimultaneousK(n = 8, rule = "Modified.CA")
  #[1] 0.8380233

  #----------

  # Show how the value of K for an upper 95% simultaneous prediction 
  # limit increases as the number of future sampling occasions r increases.  
  # Here, we'll use the 1-of-3 rule.

  predIntNormSimultaneousK(n = 8, k = 1, m = 3)
  #[1] 0.5123091 


  predIntNormSimultaneousK(n = 8, k = 1, m = 3, r = 10)
  #[1] 1.363002

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

  # Compute the value of K for the upper simultaneous prediction 
  # limit for the 1-of-3 plan.

  predIntNormSimultaneousK(n = 25, k = 1, m = 3, r = 2, 
    rule = "k.of.m", pi.type = "upper", conf.level = conf.level)
  #[1] 2.014365

  #==========

  # Cleanup
  #--------

  rm(nc, nw, SWFPR, conf.level)



