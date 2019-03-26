library(EnvStats)


### Name: EVD
### Title: The Extreme Value (Gumbel) Distribution
### Aliases: EVD 'Extreme Value Distribution' 'Gumbel Distribution' devd
###   pevd qevd revd
### Keywords: distribution datagen

### ** Examples

  # Density of an extreme value distribution with location=0, scale=1, 
  # evaluated at 0.5:

  devd(.5) 
  #[1] 0.3307043

  #----------

  # The cdf of an extreme value distribution with location=1, scale=2, 
  # evaluated at 0.5:

  pevd(.5, 1, 2) 
  #[1] 0.2769203

  #----------

  # The 25'th percentile of an extreme value distribution with 
  # location=-2, scale=0.5:

  qevd(.25, -2, 0.5) 
  #[1] -2.163317

  #----------

  # Random sample of 4 observations from an extreme value distribution with 
  # location=5, scale=2. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  revd(4, 5, 2) 
  #[1] 9.070406 7.669139 4.511481 5.903675



