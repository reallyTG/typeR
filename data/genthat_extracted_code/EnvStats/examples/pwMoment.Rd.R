library(EnvStats)


### Name: pwMoment
### Title: Estimate Probability-Weighted Moments
### Aliases: pwMoment
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a generalized extreme value distribution 
  # with parameters location=10, scale=2, and shape=.25, then compute the 
  # 0'th, 1'st and 2'nd probability-weighted moments. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rgevd(20, location = 10, scale = 2, shape = 0.25) 

  pwMoment(dat) 
  #[1] 10.59556
 
  pwMoment(dat, 1) 
  #[1] 5.798481
  
  pwMoment(dat, 2) 
  #[1] 4.060574
  
  pwMoment(dat, k = 1) 
  #[1] 4.797081
 
  pwMoment(dat, k = 2) 
  #[1] 3.059173
 
  pwMoment(dat, 1, method = "plotting.position") 
  # [1] 5.852913
 
  pwMoment(dat, 1, method = "plotting.position", 
    plot.pos = c(.325, 1)) 
  #[1] 5.586817 

  #----------

  # Clean Up
  #---------
  rm(dat)



