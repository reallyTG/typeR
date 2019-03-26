library(EnvStats)


### Name: Lognormal3
### Title: The Three-Parameter Lognormal Distribution
### Aliases: Lognormal3 'Three Parameter Lognormal' dlnorm3 plnorm3 qlnorm3
###   rlnorm3
### Keywords: distribution datagen

### ** Examples

  # Density of the three-parameter lognormal distribution with 
  # parameters meanlog=1, sdlog=2, and threshold=10, evaluated at 10.5:

  dlnorm3(10.5, 1, 2, 10) 
  #[1] 0.278794

  #----------

  # The cdf of the three-parameter lognormal distribution with 
  # parameters meanlog=2, sdlog=3, and threshold=5, evaluated at 9: 

  plnorm3(9, 2, 3, 5) 
  #[1] 0.4189546

  #----------

  # The median of the three-parameter lognormal distribution with 
  # parameters meanlog=2, sdlog=3, and threshold=20: 

  qlnorm3(0.5, 2, 3, 20) 
  #[1] 27.38906

  #----------

  # Random sample of 3 observations from the three-parameter lognormal 
  # distribution with parameters meanlog=2, sdlog=1, and threshold=-5. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rlnorm3(3, 2, 1, -5) 
  #[1] 18.6339749 -0.8873173 39.0561521



