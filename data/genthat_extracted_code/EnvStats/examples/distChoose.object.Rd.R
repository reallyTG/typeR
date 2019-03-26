library(EnvStats)


### Name: distChoose.object
### Title: S3 Class "distChoose"
### Aliases: distChoose.object
### Keywords: classes

### ** Examples

  # Create an object of class "distChoose", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(47)
  dat <- rgamma(20, shape = 2, scale = 3)

  distChoose.obj <- distChoose(dat) 

  mode(distChoose.obj) 
  #[1] "list" 

  class(distChoose.obj) 
  #[1] "distChoose" 

  names(distChoose.obj) 
  #[1] "choices"                 "method"                 
  #[3] "decision"                "alpha"                  
  #[5] "distribution.parameters" "estimation.method"      
  #[7] "sample.size"             "test.results"           
  #[9] "data"                    "data.name"  

  distChoose.obj 
  
  #Results of Choosing Distribution
  #--------------------------------
  #
  #Candidate Distributions:         Normal
  #                                 Gamma
  #                                 Lognormal
  #
  #Choice Method:                   Shapiro-Wilk
  #
  #Type I Error per Test:           0.05
  #
  #Decision:                        Gamma
  #
  #Estimated Parameter(s):          shape = 1.909462
  #                                 scale = 4.056819
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.9097488
  #    P-value:                     0.06303695
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.9834958
  #    P-value:                     0.970903
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.9185006
  #    P-value:                     0.09271768

  #==========

  # Extract the choices
  #--------------------

  distChoose.obj$choices
  #[1] "Normal"    "Gamma"     "Lognormal"

  #==========

  # Clean up
  #---------
  rm(dat, distChoose.obj)



