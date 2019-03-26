library(EnvStats)


### Name: predIntNormK
### Title: Compute the Value of K for a Prediction Interval for a Normal
###   Distribution
### Aliases: predIntNormK
### Keywords: distribution htest

### ** Examples

  # Compute the value of K for a two-sided 95% prediction interval 
  # for the next observation given a sample size of n=20.

  predIntNormK(n = 20)
  #[1] 2.144711

  #--------------------------------------------------------------------

  # Compute the value of K for a one-sided upper 99% prediction limit 
  # for the next 3 averages of order 2 (i.e., each of the 3 future 
  # averages is based on a sample size of 2 future observations) given a 
  # samle size of n=20.

  predIntNormK(n = 20, n.mean = 2, k = 3, pi.type = "upper", 
    conf.level = 0.99)
  #[1] 2.258026

  #----------

  # Compare the result above that is based on the Bonferroni method 
  # with the exact method.

  predIntNormK(n = 20, n.mean = 2, k = 3, method = "exact", 
    pi.type = "upper", conf.level = 0.99)
  #[1] 2.251084

  #--------------------------------------------------------------------

  # Example 18-1 of USEPA (2009, p.18-9) shows how to construct a 95% 
  # prediction interval for 4 future observations assuming a 
  # normal distribution based on arsenic concentrations (ppb) in 
  # groundwater at a solid waste landfill.  There were 4 years of 
  # quarterly monitoring, and years 1-3 are considered background, 

  # So the sample size for the prediciton limit is n = 12, 
  # and the number of future samples is k = 4.

  predIntNormK(n = 12, k = 4, pi.type = "upper")
  #[1] 2.698976



