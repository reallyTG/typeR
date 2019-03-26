library(EnvStats)


### Name: kurtosis
### Title: Coefficient of (Excess) Kurtosis
### Aliases: kurtosis Kurtosis 'sample kurtosis'
### Keywords: univar

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # mean=10 and cv=1, and estimate the coefficient of kurtosis and 
  # coefficient of excess kurtosis. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 

  dat <- rlnormAlt(20, mean = 10, cv = 1) 

  # Compute standard kurtosis first 
  #--------------------------------
  kurtosis(dat, excess = FALSE) 
  #[1] 2.964612
  
  kurtosis(dat, method = "moment", excess = FALSE) 
  #[1] 2.687146
  
  kurtosis(dat, method = "l.moment", excess = FALSE) 
  #[1] 0.1444779


  # Now compute excess kurtosis 
  #----------------------------
  kurtosis(dat) 
  #[1] -0.0353876
 
  kurtosis(dat, method = "moment") 
  #[1] -0.3128536
  
  kurtosis(dat, method = "l.moment") 
  #[1] -2.855522

  #----------
  # Clean up
  rm(dat)



