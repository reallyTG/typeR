library(EnvStats)


### Name: evNormOrdStats
### Title: Expected Value of Order Statistics for Random Sample from
###   Standard Normal Distribution
### Aliases: evNormOrdStats evNormOrdStatsScalar
### Keywords: distribution

### ** Examples

  # Compute the expected value of the minimum for a random sample of size 10 
  # from a standard normal distribution:

  # Based on method="royston"
  #--------------------------
  evNormOrdStatsScalar(r = 1, n = 10) 
  #[1] -1.538753


  # Based on method="blom"
  #-----------------------
  evNormOrdStatsScalar(r = 1, n = 10, method = "blom") 
  #[1] -1.546635


  # Based on method="mc" with 10,000 Monte Carlo trials
  #----------------------------------------------------
  evNormOrdStatsScalar(r = 1, n = 10, method = "mc", nmc = 10000) 
  #[1] -1.544318
  #attr(,"confint")
  #   95%LCL    95%UCL 
  #-1.555838 -1.532797 
  #attr(,"nmc")
  #[1] 10000

  #====================

  # Compute the expected values of all of the order statistics 
  # for a random sample of size 10 from a standard normal distribution
  # based on Royston's (1982) method:
  #--------------------------------------------------------------------

  evNormOrdStats(10) 
  #[1] -1.5387527 -1.0013570 -0.6560591 -0.3757647 -0.1226678
  #[6]  0.1226678  0.3757647  0.6560591  1.0013570  1.5387527


  # Compare the above with Blom (1958) scores:
  #-------------------------------------------

  evNormOrdStats(10, method = "blom") 
  #[1] -1.5466353 -1.0004905 -0.6554235 -0.3754618 -0.1225808
  #[6]  0.1225808  0.3754618  0.6554235  1.0004905  1.5466353



