library(EnvStats)


### Name: gofCensored.object
### Title: S3 Class "gofCensored"
### Aliases: gofCensored.object gofCensored
### Keywords: classes

### ** Examples

  # Create an object of class "gofCensored", then print it out. 
  #------------------------------------------------------------

  gofCensored.obj <- with(EPA.09.Ex.15.1.manganese.df,
    gofTestCensored(Manganese.ppb, Censored, test = "sf"))

  mode(gofCensored.obj) 
  #[1] "list" 

  class(gofCensored.obj) 
  #[1] "gofCensored" 

  names(gofCensored.obj) 
  # [1] "distribution"            "dist.abb"               
  # [3] "distribution.parameters" "n.param.est"            
  # [5] "estimation.method"       "statistic"              
  # [7] "sample.size"             "censoring.side"         
  # [9] "censoring.levels"        "percent.censored"       
  #[11] "parameters"              "z.value"                
  #[13] "p.value"                 "alternative"            
  #[15] "method"                  "data"                   
  #[17] "data.name"               "censored"               
  #[19] "censoring.name"          "bad.obs" 

  gofCensored.obj 
  
  #Results of Goodness-of-Fit Test
  #Based on Type I Censored Data
  #-------------------------------
  #
  #Test Method:                     Shapiro-Francia GOF
  #                                 (Multiply Censored Data)
  #
  #Hypothesized Distribution:       Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              2 5 
  #
  #Estimated Parameter(s):          mean = 15.23508
  #                                 sd   = 30.62812
  #
  #Estimation Method:               MLE
  #
  #Data:                            Manganese.ppb
  #
  #Censoring Variable:              Censored
  #
  #Sample Size:                     25
  #
  #Percent Censored:                24%
  #
  #Test Statistic:                  W = 0.8368016
  #
  #Test Statistic Parameters:       N     = 25.00
  #                                 DELTA =  0.24
  #
  #P-value:                         0.004662658
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Normal Distribution.

  #==========

  # Extract the p-value
  #--------------------

  gofCensored.obj$p.value
  #[1] 0.004662658

  #==========

  # Plot the results of the test
  #-----------------------------

  dev.new()
  plot(gofCensored.obj)

  #==========

  # Clean up
  #---------
  rm(gofCensored.obj)
  graphics.off()



