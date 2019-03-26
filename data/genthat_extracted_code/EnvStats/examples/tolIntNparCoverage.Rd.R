library(EnvStats)


### Name: tolIntNparCoverage
### Title: Coverage for Nonparametric Tolerance Interval for Continuous
###   Distribution
### Aliases: tolIntNparCoverage
### Keywords: distribution design htest

### ** Examples

  # Look at how the coverage of a nonparametric tolerance interval increases with 
  # increasing sample size:

  seq(10, 60, by=10) 
  #[1] 10 20 30 40 50 60 

  round(tolIntNparCoverage(n = seq(10, 60, by = 10)), 2) 
  #[1] 0.61 0.78 0.85 0.89 0.91 0.92

  #---------

  # Look at how the coverage of a nonparametric tolerance interval decreases with 
  # increasing confidence level:

  seq(0.5, 0.9, by=0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  round(tolIntNparCoverage(n = 10, conf.level = seq(0.5, 0.9, by = 0.1)), 2) 
  #[1] 0.84 0.81 0.77 0.73 0.66

  #----------

  # Look at how the coverage of a nonparametric tolerance interval decreases with 
  # the rank of the lower tolerance limit:

  round(tolIntNparCoverage(n = 60, ltl.rank = 1:5), 2) 
  #[1] 0.92 0.90 0.88 0.85 0.83

  #==========

  # Example 17-4 on page 17-21 of USEPA (2009) uses copper concentrations (ppb) from 3 
  # background wells to set an upper limit for 2 compliance wells.  The maximum value from 
  # the 3 wells is set to the 95% confidence upper tolerance limit, and we need to 
  # determine the coverage of this tolerance interval.  

  tolIntNparCoverage(n = 24, conf.level = 0.95, ti.type = "upper")
  #[1] 0.8826538



