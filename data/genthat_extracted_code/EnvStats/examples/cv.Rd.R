library(EnvStats)


### Name: cv
### Title: Sample Coefficient of Variation.
### Aliases: cv CV 'coefficient of variation' 'Coefficient of Variation'
### Keywords: univar

### ** Examples

  # Generate 20 observations from a lognormal distribution with 
  # parameters mean=10 and cv=1, and estimate the coefficient of variation. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormAlt(20, mean = 10, cv = 1) 

  cv(dat) 
  #[1] 0.5077981

  cv(dat, sd.method = "moments") 
  #[1] 0.4949403
 
  cv(dat, method = "l.moments") 
  #[1] 0.2804148

  #----------
  # Clean up
  rm(dat)



