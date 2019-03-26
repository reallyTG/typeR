library(EnvStats)


### Name: simulateVector
### Title: Simulate a Vector of Random Numbers From a Specified Theoretical
###   or Empirical Probability Distribution
### Aliases: simulateVector
### Keywords: distribution datagen

### ** Examples

  # Generate 10 observations from a lognormal distribution with 
  # parameters mean=10 and cv=1 using simple random sampling:

  simulateVector(10, distribution = "lnormAlt", 
    param.list = list(mean = 10, cv = 1), seed = 47, 
    sort = TRUE) 
  # [1]  2.086931  2.863589  3.112866  5.592502  5.732602  7.160707
  # [7]  7.741327  8.251306 12.782493 37.214748

  #----------

  # Repeat the above example by calling rlnormAlt directly:

  set.seed(47) 
  sort(rlnormAlt(10, mean = 10, cv = 1))
  # [1]  2.086931  2.863589  3.112866  5.592502  5.732602  7.160707
  # [7]  7.741327  8.251306 12.782493 37.214748

  #----------

  # Now generate 10 observations from the same lognormal distribution 
  # but use Latin Hypercube sampling.  Note that the largest value
  # is larger than for simple random sampling:

  simulateVector(10, distribution = "lnormAlt", 
    param.list = list(mean = 10, cv = 1), seed = 47,
    sample.method = "LHS", sort = TRUE) 
  # [1]  2.406149  2.848428  4.311175  5.510171  6.467852  8.174608
  # [7]  9.506874 12.298185 17.022151 53.552699

  #==========

  # Generate 50 observations from a Pareto distribution with parameters 
  # location=10 and shape=2, then use this resulting vector of 
  # observations as the basis for generating 3 observations from an 
  # empirical distribution using Latin Hypercube sampling:

  set.seed(321) 
  pareto.rns <- rpareto(50, location = 10, shape = 2)
 
  simulateVector(3, distribution = "emp", 
    param.list = list(obs = pareto.rns), sample.method = "LHS") 
  #[1] 11.50685 13.50962 17.47335

  #==========

  # Clean up
  #---------
  rm(pareto.rns)



