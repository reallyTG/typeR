library(EnvStats)


### Name: ZeroModifiedLognormalAlt
### Title: The Zero-Modified Lognormal (Delta) Distribution (Alternative
###   Parameterization)
### Aliases: ZeroModifiedLognormalAlt DeltaDistAlt 'Delta Distribution
###   (Alternative Parameterization)' 'Zero-Modified Lognormal (Alternative
###   Parameterization)' 'Zero Modified Lognormal (Alternative
###   Parameterization)' dzmlnormAlt pzmlnormAlt qzmlnormAlt rzmlnormAlt
### Keywords: distribution datagen

### ** Examples

  # Density of the zero-modified lognormal (delta) distribution with 
  # parameters mean=10, cv=1, and p.zero=0.5, evaluated at 
  # 9, 10, and 11:

  dzmlnormAlt(9:11, mean = 10, cv = 1, p.zero = 0.5) 
  #[1] 0.02552685 0.02197043 0.01891924

  #----------

  # The cdf of the zero-modified lognormal (delta) distribution with 
  # parameters mean=10, cv=2, and p.zero=0.1, evaluated at 8:

  pzmlnormAlt(8, 10, 2, .1) 
  #[1] 0.709009

  #----------

  # The median of the zero-modified lognormal (delta) distribution with 
  # parameters mean=10, cv=2, and p.zero=0.1:

  qzmlnormAlt(0.5, 10, 2, 0.1) 
  #[1] 3.74576

  #----------

  # Random sample of 3 observations from the zero-modified lognormal 
  # (delta) distribution with parameters mean=10, cv=2, and p.zero=0.4. 
  # (Note: The call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rzmlnormAlt(3, 10, 2, 0.4)
  #[1] 0.000000 0.000000 4.907131



