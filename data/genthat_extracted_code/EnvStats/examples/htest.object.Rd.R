library(EnvStats)


### Name: htest.object
### Title: S3 Class "htest"
### Aliases: htest.object
### Keywords: classes

### ** Examples

  # Create an object of class "htest", then print it out. 
  #------------------------------------------------------

  htest.obj <- chenTTest(EPA.02d.Ex.9.mg.per.L.vec, mu = 30)

  mode(htest.obj) 
  #[1] "list" 

  class(htest.obj) 
  #[1] "htest" 

  names(htest.obj) 
  # [1] "statistic"   "parameters"  "p.value"     "estimate"   
  # [5] "null.value"  "alternative" "method"      "sample.size"
  # [9] "data.name"   "bad.obs"     "interval" 
 
  htest.obj 
  
  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 mean = 30
  #
  #Alternative Hypothesis:          True mean is greater than 30
  #
  #Test Name:                       One-sample t-Test
  #                                 Modified for
  #                                 Positively-Skewed Distributions
  #                                 (Chen, 1995)
  #
  #Estimated Parameter(s):          mean = 34.566667
  #                                 sd   = 27.330598
  #                                 skew =  2.365778
  #
  #Data:                            EPA.02d.Ex.9.mg.per.L.vec
  #
  #Sample Size:                     60
  #
  #Test Statistic:                  t = 1.574075
  #
  #Test Statistic Parameter:        df = 59
  #
  #P-values:                        z               = 0.05773508
  #                                 t               = 0.06040889
  #                                 Avg. of z and t = 0.05907199
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Based on z
  #
  #Confidence Interval Type:        Lower
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 29.82
  #                                 UCL =   Inf

  #==========

  # Extract the test statistic
  #---------------------------

  htest.obj$statistic
  #       t 
  #1.574075

  #==========

  # Clean up
  #---------
  rm(htest.obj)



