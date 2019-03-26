library(EnvStats)


### Name: distChooseCensored.object
### Title: S3 Class "distChooseCensored"
### Aliases: distChooseCensored.object
### Keywords: classes

### ** Examples

  # Create an object of class "distChooseCensored", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(598)

  dat <- rgammaAlt(30, mean = 10, cv = 1)
  censored <- dat < 5
  dat[censored] <- 5

  distChooseCensored.obj <- distChooseCensored(dat, censored, 
    method = "sw", choices = c("norm", "gammaAlt", "lnormAlt"))

  mode(distChooseCensored.obj) 
  #[1] "list" 

  class(distChooseCensored.obj) 
  #[1] "distChooseCensored" 

  names(distChooseCensored.obj) 
  # [1] "choices"                 "method"                 
  # [3] "decision"                "alpha"                  
  # [5] "distribution.parameters" "estimation.method"      
  # [7] "sample.size"             "censoring.side"         
  # [9] "censoring.levels"        "percent.censored"       
  #[11] "test.results"            "data"                   
  #[13] "censored"                "data.name"              
  #[15] "censoring.name" 

  distChooseCensored.obj 
  
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
  #Estimated Parameter(s):          mean = 12.4911448
  #                                 cv   =  0.7617343
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat.censored
  #
  #Sample Size:                     30
  #
  #Censoring Side:                  left
  #
  #Censoring Variable:              censored
  #
  #Censoring Level(s):              5 
  #
  #Percent Censored:                23.33333%
  #
  #Test Results:
  #
  #  Normal                         
  #    Test Statistic:              W = 0.9372741
  #    P-value:                     0.1704876
  #
  #  Gamma                          
  #    Test Statistic:              W = 0.9613711
  #    P-value:                     0.522329
  #
  #  Lognormal                      
  #    Test Statistic:              W = 0.9292406
  #    P-value:                     0.114511

  #==========

  # Extract the choices
  #--------------------

  distChooseCensored.obj$choices
  #[1] "Normal"    "Gamma"     "Lognormal"

  #==========

  # Clean up
  #---------
  rm(dat, censored, distChooseCensored.obj)



