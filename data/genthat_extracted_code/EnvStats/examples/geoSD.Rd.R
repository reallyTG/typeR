library(EnvStats)


### Name: geoSD
### Title: Geometric Standard Deviation.
### Aliases: geoSD 'Geometric Standard Deviation' 'geometric standard
###   deviation' 'geometric SD' 'Geometric SD'
### Keywords: univar

### ** Examples

  # Generate 2000 observations from a lognormal distribution with parameters 
  # mean=10 and cv=1, which implies the standard deviation (on the original 
  # scale) is 10.  Compute the mean, geometric mean, standard deviation, 
  # and geometric standard deviation. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormAlt(2000, mean = 10, cv = 1) 

  mean(dat) 
  #[1] 10.23417
 
  geoMean(dat) 
  #[1] 7.160154
 
  sd(dat) 
  #[1] 9.786493
 
  geoSD(dat) 
  #[1] 2.334358

  #----------
  # Clean up
  rm(dat)



