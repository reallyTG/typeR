library(EnvStats)


### Name: estimate.object
### Title: S3 Class "estimate"
### Aliases: estimate.object estimate
### Keywords: classes

### ** Examples

  # Create an object of class "estimate", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 

  dat <- rnorm(20, mean = 3, sd = 2) 

  estimate.obj <- enorm(dat, ci = TRUE) 

  mode(estimate.obj) 
  #[1] "list" 

  class(estimate.obj) 
  #[1] "estimate" 

  names(estimate.obj) 
  #[1] "distribution" "sample.size"  "parameters" 
  #[4] "n.param.est"  "method"       "data.name" 
  #[7] "bad.obs"      "interval" 

  names(estimate.obj$interval) 
  #[1] "name"        "parameter"   "limits" 
  #[4] "type"        "method"      "conf.level" 
  #[7] "sample.size" "dof" 

  estimate.obj 
  
  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
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
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 2.308798
  #                                 UCL = 3.413523

  #----------

  # Extract the confidence limits for the mean

  estimate.obj$interval$limits
  #     LCL      UCL 
  #2.308798 3.413523 

  #----------

  # Clean up

  rm(dat, estimate.obj)



