library(EnvStats)


### Name: estimateCensored.object
### Title: S3 Class "estimateCensored"
### Aliases: estimateCensored.object estimateCensored
### Keywords: classes

### ** Examples

  # Create an object of class "estimateCensored", then print it out. 
  # (Note: the call to set.seed simply allows you to reproduce 
  # this example.)

  set.seed(250) 

  dat <- rnorm(20, mean = 100, sd = 20)
  censored <- dat < 90
  dat[censored] <- 90

  estimateCensored.obj <- enormCensored(dat, censored, ci = TRUE) 

  mode(estimateCensored.obj) 
  #[1] "list" 

  class(estimateCensored.obj) 
  #[1] "estimateCensored" 

  names(estimateCensored.obj) 
  # [1] "distribution"     "sample.size"      "censoring.side"   "censoring.levels"
  # [5] "percent.censored" "parameters"       "n.param.est"      "method"          
  # [9] "data.name"        "censoring.name"   "bad.obs"          "interval"        
  #[13] "var.cov.params" 

  names(estimateCensored.obj$interval) 
  #[1] "name"       "parameter"  "limits"     "type"       "method"     "conf.level"
 

  estimateCensored.obj 
  
  #Results of Distribution Parameter Estimation
  #Based on Type I Censored Data
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Censoring Side:                  left
  #
  #Censoring Level(s):              90 
  #
  #Estimated Parameter(s):          mean = 96.52796
  #                                 sd   = 14.62275
  #
  #Estimation Method:               MLE
  #
  #Data:                            dat
  #
  #Censoring Variable:              censored
  #
  #Sample Size:                     20
  #
  #Percent Censored:                25%
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Profile Likelihood
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  88.82415
  #                                 UCL = 103.27604


  #----------

  # Extract the confidence limits for the mean

  estimateCensored.obj$interval$limits
  #     LCL      UCL 
  # 91.7801 103.7839 

  #----------

  # Clean up

  rm(dat, censored, estimateCensored.obj)



