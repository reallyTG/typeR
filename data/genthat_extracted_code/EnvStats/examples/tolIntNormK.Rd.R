library(EnvStats)


### Name: tolIntNormK
### Title: Compute the Value of K for a Tolerance Interval for a Normal
###   Distribution
### Aliases: tolIntNormK
### Keywords: distribution htest

### ** Examples

  # Compute the value of K for a two-sided 95% beta-content 
  # tolerance interval with associated confidence level 95% 
  # given a sample size of n=20.

  #----------
  # Exact method

  tolIntNormK(n = 20)
  #[1] 2.760346

  #----------
  # Approximate method due to Wald and Wolfowitz (1946)

  tolIntNormK(n = 20, method = "wald")
  # [1] 2.751789


  #--------------------------------------------------------------------

  # Compute the value of K for a one-sided upper tolerance limit 
  # with 99% coverage and associated confidence level 90% 
  # given a samle size of n=20.

  tolIntNormK(n = 20, ti.type = "upper", coverage = 0.99, 
    conf.level = 0.9)
  #[1] 3.051543

  #--------------------------------------------------------------------

  # Example 17-3 of USEPA (2009, p. 17-17) shows how to construct a 
  # beta-content upper tolerance limit with 95% coverage and 95% 
  # confidence  using chrysene data and assuming a lognormal 
  # distribution.  The sample size is n = 8 observations from 
  # the two compliance wells.  Here we will compute the 
  # multiplier for the log-transformed data.

  tolIntNormK(n = 8, ti.type = "upper")
  #[1] 3.187294



