library(EnvStats)


### Name: tolIntNparConfLevel
### Title: Confidence Level for Nonparametric Tolerance Interval for
###   Continuous Distribution
### Aliases: tolIntNparConfLevel
### Keywords: distribution design htest

### ** Examples

  # Look at how the confidence level of a nonparametric tolerance interval increases with 
  # increasing sample size:

  seq(10, 60, by=10) 
  #[1] 10 20 30 40 50 60 

  round(tolIntNparConfLevel(n = seq(10, 60, by = 10)), 2) 
  #[1] 0.09 0.26 0.45 0.60 0.72 0.81

  #----------

  # Look at how the confidence level of a nonparametric tolerance interval decreases with 
  # increasing coverage:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  round(tolIntNparConfLevel(n = 10, coverage = seq(0.5, 0.9, by = 0.1)), 2) 
  #[1] 0.99 0.95 0.85 0.62 0.26

  #----------

  # Look at how the confidence level of a nonparametric tolerance interval decreases with the 
  # rank of the lower tolerance limit:

  round(tolIntNparConfLevel(n = 60, ltl.rank = 1:5), 2) 
  #[1] 0.81 0.58 0.35 0.18 0.08

  #==========

  # Example 17-4 on page 17-21 of USEPA (2009) uses copper concentrations (ppb) from 3 
  # background wells to set an upper limit for 2 compliance wells.  There are 6 observations 
  # per well, and the maximum value from the 3 wells is set to the 95% confidence upper 
  # tolerance limit, and we need to determine the coverage of this tolerance interval.  

  tolIntNparCoverage(n = 24, conf.level = 0.95, ti.type = "upper")
  #[1] 0.8826538

  # Here we will modify the example and determine the confidence level of the tolerance 
  # interval when we set the coverage to 95%. 

  tolIntNparConfLevel(n = 24, coverage = 0.95, ti.type = "upper")
  # [1] 0.708011



