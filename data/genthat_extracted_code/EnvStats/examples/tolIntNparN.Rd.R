library(EnvStats)


### Name: tolIntNparN
### Title: Sample Size for Nonparametric Tolerance Interval for Continuous
###   Distribution
### Aliases: tolIntNparN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for a nonparametric tolerance interval increases 
  # with increasing confidence level:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  tolIntNparN(conf.level = seq(0.5, 0.9, by = 0.1)) 
  #[1] 34 40 49 59 77

  #----------

  # Look at how the required sample size for a nonparametric tolerance interval increases 
  # with increasing coverage:

  tolIntNparN(coverage = seq(0.5, 0.9, by = 0.1)) 
  #[1]  8 10 14 22 46

  #----------

  # Look at how the required sample size for a nonparametric tolerance interval increases 
  # with the rank of the lower tolerance limit:

  tolIntNparN(ltl.rank = 1:5) 
  #[1]  93 124 153 181 208

  #==========

  # Example 17-4 on page 17-21 of USEPA (2009) uses copper concentrations (ppb) from 3 
  # background wells to set an upper limit for 2 compliance wells.  The maximum value from 
  # the 3 wells is set to the 95% confidence upper tolerance limit, and we need to 
  # determine the coverage of this tolerance interval.  

  tolIntNparCoverage(n = 24, conf.level = 0.95, ti.type = "upper")
  #[1] 0.8826538

  # Here we will modify the example and determine the sample size required to produce 
  # a tolerance interval with 95% confidence level AND 95% coverage. 

  tolIntNparN(coverage = 0.95, conf.level = 0.95, ti.type = "upper")
  #[1] 59



