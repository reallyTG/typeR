library(EnvStats)


### Name: ZeroModifiedLognormal
### Title: The Zero-Modified Lognormal (Delta) Distribution
### Aliases: ZeroModifiedLognormal 'Zero-Modified Lognormal' 'Zero-Modified
###   Lognormal (Delta)' 'Zero Modified Lognormal' 'Zero Modified Lognormal
###   (Delta)' DeltaDist 'Delta Distribution' dzmlnorm pzmlnorm qzmlnorm
###   rzmlnorm
### Keywords: distribution datagen

### ** Examples

  # Density of the zero-modified lognormal (delta) distribution with 
  # parameters meanlog=0, sdlog=1, and p.zero=0.5, evaluated at 
  # 0, 0.5, 1, 1.5, and 2:

  dzmlnorm(seq(0, 2, by = 0.5)) 
  #[1] 0.50000000 0.31374804 0.19947114 0.12248683 
  #[5] 0.07843701

  #----------

  # The cdf of the zero-modified lognormal (delta) distribution with 
  # parameters meanlog=1, sdlog=2, and p.zero=0.1, evaluated at 4:

  pzmlnorm(4, 1, 2, .1) 
  #[1] 0.6189203

  #----------

  # The median of the zero-modified lognormal (delta) distribution with 
  # parameters meanlog=2, sdlog=3, and p.zero=0.1:

  qzmlnorm(0.5, 2, 3, 0.1) 
  #[1] 4.859177

  #----------

  # Random sample of 3 observations from the zero-modified lognormal 
  # (delta) distribution with parameters meanlog=1, sdlog=2, and p.zero=0.4. 
  # (Note: The call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rzmlnorm(3, 1, 2, 0.4)
  #[1] 0.000000 0.000000 3.146641



