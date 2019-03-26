library(EnvStats)


### Name: GEVD
### Title: The Generalized Extreme Value Distribution
### Aliases: GEVD 'Generalized Extreme Value Distribution' dgevd pgevd
###   qgevd rgevd
### Keywords: distribution datagen

### ** Examples

  # Density of a generalized extreme value distribution with 
  # location=0, scale=1, and shape=0, evaluated at 0.5: 

  dgevd(.5) 
  #[1] 0.3307043

  #----------

  # The cdf of a generalized extreme value distribution with 
  # location=1, scale=2, and shape=0.25, evaluated at 0.5: 

  pgevd(.5, 1, 2, 0.25) 
  #[1] 0.2795905

  #----------

  # The 90'th percentile of a generalized extreme value distribution with 
  # location=-2, scale=0.5, and shape=-0.25: 

  qgevd(.9, -2, 0.5, -0.25) 
  #[1] -0.4895683

  #----------

  # Random sample of 4 observations from a generalized extreme value 
  # distribution with location=5, scale=2, and shape=1. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rgevd(4, 5, 2, 1) 
  #[1] 6.738692 6.473457 4.446649 5.727085



