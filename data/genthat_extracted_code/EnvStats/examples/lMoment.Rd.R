library(EnvStats)


### Name: lMoment
### Title: Estimate L-Moments
### Aliases: lMoment
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a generalized extreme value distribution 
  # with parameters location=10, scale=2, and shape=.25, then compute the 
  # first four L-moments. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rgevd(20, location = 10, scale = 2, shape = 0.25) 

  lMoment(dat) 
  #[1] 10.59556 

  lMoment(dat, 2) 
  #[1] 1.0014 

  lMoment(dat, 3) 
  #[1] 0.1681165
 
  lMoment(dat, 4) 
  #[1] 0.08732692

  #----------

  # Now compute some L-moments based on the plotting-position estimators:

  lMoment(dat, method = "plotting.position") 
  #[1] 10.59556

  lMoment(dat, 2, method = "plotting.position") 
  #[1] 1.110264 

  lMoment(dat, 3, method="plotting.position", plot.pos.cons = c(.325,1)) 
  #[1] -0.4430792
 
  #----------

  # Clean up
  #---------
  rm(dat)



