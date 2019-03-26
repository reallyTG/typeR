library(EnvStats)


### Name: Pareto
### Title: The Pareto Distribution
### Aliases: Pareto dpareto ppareto qpareto rpareto
### Keywords: distribution datagen

### ** Examples

  # Density of a Pareto distribution with parameters location=1 and shape=1, 
  # evaluated at 2, 3 and 4: 

  dpareto(2:4, 1, 1) 
  #[1] 0.2500000 0.1111111 0.0625000

  #----------

  # The cdf of a Pareto distribution with parameters location=2 and shape=1, 
  # evaluated at 3, 4, and 5: 

  ppareto(3:5, 2, 1) 
  #[1] 0.3333333 0.5000000 0.6000000

  #----------

  # The 25'th percentile of a Pareto distribution with parameters 
  # location=1 and shape=1: 

  qpareto(0.25, 1, 1) 
  #[1] 1.333333

  #----------

  # A random sample of 4 numbers from a Pareto distribution with parameters 
  # location=3 and shape=2. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(10) 
  rpareto(4, 3, 2)
  #[1] 4.274728 3.603148 3.962862 5.415322



