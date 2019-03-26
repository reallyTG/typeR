library(EnvStats)


### Name: skewness
### Title: Coefficient of Skewness
### Aliases: skewness Skewness skew Skew
### Keywords: univar

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # mean=10 and cv=1, and estimate the coefficient of skewness. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 

  dat <- rlnormAlt(20, mean = 10, cv = 1) 

  skewness(dat) 
  #[1] 0.9876632
 
  skewness(dat, method = "moment") 
  #[1] 0.9119889
 
  skewness(dat, meth = "l.moment") 
  #[1] 0.2656674

  #----------
  # Clean up
  rm(dat)



