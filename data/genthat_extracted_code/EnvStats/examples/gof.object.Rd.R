library(EnvStats)


### Name: gof.object
### Title: S3 Class "gof"
### Aliases: gof.object gof
### Keywords: classes

### ** Examples

  # Create an object of class "gof", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 

  dat <- rnorm(20, mean = 3, sd = 2) 

  gof.obj <- gofTest(dat) 

  mode(gof.obj) 
  #[1] "list" 

  class(gof.obj) 
  #[1] "gof" 

  names(gof.obj) 
  # [1] "distribution"            "dist.abb"               
  # [3] "distribution.parameters" "n.param.est"            
  # [5] "estimation.method"       "statistic"              
  # [7] "sample.size"             "parameters"             
  # [9] "z.value"                 "p.value"                
  #[11] "alternative"             "method"                 
  #[13] "data"                    "data.name"              
  #[15] "bad.obs" 

  gof.obj 
  
  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Normal
  #
  #Estimated Parameter(s):          mean = 2.861160
  #                                 sd   = 1.180226
  #
  #Estimation Method:               mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Test Statistic:                  W = 0.9640724
  #
  #Test Statistic Parameter:        n = 20
  #
  #P-value:                         0.6279872
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Normal Distribution.

  #==========

  # Extract the p-value
  #--------------------

  gof.obj$p.value
  #[1] 0.6279872

  #==========

  # Plot the results of the test
  #-----------------------------

  dev.new()
  plot(gof.obj)

  #==========

  # Clean up
  #---------
  rm(dat, gof.obj)
  graphics.off()



