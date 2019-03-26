library(EnvStats)


### Name: geoMean
### Title: Geometric Mean
### Aliases: geoMean 'geometric mean' 'Geometric Mean'
### Keywords: univar

### ** Examples

  # Generate 20 observations from a lognormal distribution with parameters 
  # mean=10 and cv=2, and compute the mean, median, and geometric mean. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnormAlt(20, mean = 10, cv = 2) 

  mean(dat) 
  #[1] 5.339273

  median(dat) 
  #[1] 3.692091
 
  geoMean(dat) 
  #[1] 4.095127
 
  #----------
  # Clean up
  rm(dat)



