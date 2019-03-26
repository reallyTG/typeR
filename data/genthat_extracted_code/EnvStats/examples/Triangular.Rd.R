library(EnvStats)


### Name: Triangular
### Title: The Triangular Distribution
### Aliases: Triangular dtri ptri qtri rtri
### Keywords: distribution datagen

### ** Examples

  # Density of a triangular distribution with parameters 
  # min=10, max=15, and mode=12, evaluated at 12, 13 and 14: 

  dtri(12:14, 10, 15, 12) 
  #[1] 0.4000000 0.2666667 0.1333333

  #----------

  # The cdf of a triangular distribution with parameters 
  # min=2, max=7, and mode=5, evaluated at 3, 4, and 5: 

  ptri(3:5, 2, 7, 5) 
  #[1] 0.06666667 0.26666667 0.60000000

  #----------

  # The 25'th percentile of a triangular distribution with parameters 
  # min=1, max=4, and mode=3: 

  qtri(0.25, 1, 4, 3) 
  #[1] 2.224745

  #----------

  # A random sample of 4 numbers from a triangular distribution with 
  # parameters min=3 , max=20, and mode=12. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(10) 
  rtri(4, 3, 20, 12) 
  #[1] 11.811593  9.850955 11.081885 13.539496



