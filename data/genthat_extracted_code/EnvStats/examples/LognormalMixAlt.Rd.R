library(EnvStats)


### Name: LognormalMixAlt
### Title: Mixture of Two Lognormal Distributions (Alternative
###   Parameterization)
### Aliases: LognormalMixAlt dlnormMixAlt plnormMixAlt qlnormMixAlt
###   rlnormMixAlt
### Keywords: distribution datagen

### ** Examples

  # Density of a lognormal mixture with parameters mean=2, cv1=3, 
  # mean2=4, cv2=5, p.mix=0.5, evaluated at 1.5: 

  dlnormMixAlt(1.5, mean1 = 2, cv1 = 3, mean2 = 4, cv2 = 5, p.mix = 0.5) 
  #[1] 0.1436045

  #----------

  # The cdf of a lognormal mixture with parameters mean=2, cv1=3, 
  # mean2=4, cv2=5, p.mix=0.5, evaluated at 1.5: 

  plnormMixAlt(1.5, mean1 = 2, cv1 = 3, mean2 = 4, cv2 = 5, p.mix = 0.5) 
  #[1] 0.6778064

  #----------

  # The median of a lognormal mixture with parameters mean=2, cv1=3, 
  # mean2=4, cv2=5, p.mix=0.5: 

  qlnormMixAlt(0.5, 2, 3, 4, 5, 0.5) 
  #[1] 0.6978355

  #----------

  # Random sample of 3 observations from a lognormal mixture with 
  # parameters mean1=2, cv1=3, mean2=4, cv2=5, p.mix=0.5. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnormMixAlt(3, 2, 3, 4, 5, 0.5) 
  #[1]  0.70672151 14.43226313  0.05521329



