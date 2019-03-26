library(EnvStats)


### Name: ZeroModifiedNormal
### Title: The Zero-Modified Normal Distribution
### Aliases: ZeroModifiedNormal 'Zero-Modified Normal' 'Zero Modified
###   Normal' dzmnorm pzmnorm qzmnorm rzmnorm
### Keywords: distribution datagen

### ** Examples

  # Density of the zero-modified normal distribution with parameters 
  # mean=2, sd=1, and p.zero=0.5, evaluated at 0, 0.5, 1, 1.5, and 2:

  dzmnorm(seq(0, 2, by = 0.5), mean = 2) 
  #[1] 0.5000000 0.0647588 0.1209854 0.1760327 0.1994711

  #----------

  # The cdf of the zero-modified normal distribution with parameters 
  # mean=3, sd=2, and p.zero=0.1, evaluated at 4:

  pzmnorm(4, 3, 2, .1) 
  #[1] 0.7223162

  #----------

  # The median of the zero-modified normal distribution with parameters 
  # mean=3, sd=1, and p.zero=0.1:

  qzmnorm(0.5, 3, 1, 0.1) 
  #[1] 2.86029

  #----------

  # Random sample of 3 observations from the zero-modified normal distribution 
  # with parameters mean=3, sd=1, and p.zero=0.4. 
  # (Note: The call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rzmnorm(3, 3, 1, 0.4) 
  #[1] 0.000000 0.000000 3.073168



