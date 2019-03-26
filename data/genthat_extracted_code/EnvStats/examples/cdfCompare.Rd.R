library(EnvStats)


### Name: cdfCompare
### Title: Plot Two Cumulative Distribution Functions
### Aliases: cdfCompare 'Compare CDFs'
### Keywords: distribution hplot

### ** Examples

  # Generate 20 observations from a normal (Gaussian) distribution 
  # with mean=10 and sd=2 and compare the empirical cdf with a 
  # theoretical normal cdf that is based on estimating the parameters. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rnorm(20, mean = 10, sd = 2) 
  dev.new()
  cdfCompare(x)

  #----------

  # Generate 30 observations from an exponential distribution with parameter 
  # rate=0.1 (see the R help file for Exponential) and compare the empirical 
  # cdf with the empirical cdf of the normal observations generated in the 
  # previous example:

  set.seed(432)
  y <- rexp(30, rate = 0.1) 
  dev.new()
  cdfCompare(x, y)

  #==========

  # Generate 20 observations from a Poisson distribution with parameter lambda=10 
  # (see the R help file for Poisson) and compare the empirical cdf with a 
  # theoretical Poisson cdf based on estimating the distribution parameters. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  x <- rpois(20, lambda = 10) 
  dev.new()
  cdfCompare(x, dist = "pois")

  #==========

  # Clean up
  #---------
  rm(x, y)
  graphics.off()



