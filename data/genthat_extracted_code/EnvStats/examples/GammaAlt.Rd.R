library(EnvStats)


### Name: GammaAlt
### Title: The Gamma Distribution (Alternative Parameterization)
### Aliases: GammaAlt 'Gamma Distribution' dgammaAlt pgammaAlt qgammaAlt
###   rgammaAlt
### Keywords: distribution datagen

### ** Examples

  # Density of a gamma distribution with parameters mean=10 and cv=2, 
  # evaluated at 7:

  dgammaAlt(7, mean = 10, cv = 2) 
  #[1] 0.02139335

  #----------

  # The cdf of a gamma distribution with parameters mean=10 and cv=2, 
  # evaluated at 12:

  pgammaAlt(12, mean = 10, cv = 2) 
  #[1] 0.7713307

  #----------

  # The 25'th percentile of a gamma distribution with parameters 
  # mean=10 and cv=2:

  qgammaAlt(0.25, mean = 10, cv = 2) 
  #[1] 0.1056871

  #----------

  # A random sample of 4 numbers from a gamma distribution with 
  # parameters mean=10 and cv=2. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(10) 
  rgammaAlt(4, mean = 10, cv = 2) 
  #[1] 3.772004230 1.889028078 0.002987823 8.179824976



