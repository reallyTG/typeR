library(EnvStats)


### Name: tTestPower
### Title: Power of a One- or Two-Sample t-Test
### Aliases: tTestPower 't-test power' 'T-test power' 't-test Power' 'Power
###   t-test' 'power t-test'
### Keywords: distribution design htest

### ** Examples

  # Look at how the power of the one-sample t-test increases with 
  # increasing sample size:

  seq(5, 30, by = 5) 
  #[1] 5 10 15 20 25 30 

  power <- tTestPower(n.or.n1 = seq(5, 30, by = 5), delta.over.sigma = 0.5) 

  round(power, 2) 
  #[1] 0.14 0.29 0.44 0.56 0.67 0.75

  #----------

  # Repeat the last example, but use the approximation.
  # Note how the approximation underestimates the power 
  # for the smaller sample sizes.
  #----------------------------------------------------

  power <- tTestPower(n.or.n1 = seq(5, 30, by = 5), delta.over.sigma = 0.5, 
    approx = TRUE) 

  round(power, 2) 
  #[1] 0.10 0.26 0.42 0.56 0.67 0.75

  #----------

  # Look at how the power of the two-sample t-test increases with increasing 
  # scaled difference:

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  power <- tTestPower(10, sample.type = "two.sample", 
    delta.over.sigma = seq(0.5, 2, by = 0.5)) 

  round(power, 2) 
  #[1] 0.19 0.56 0.89 0.99

  #----------

  # Look at how the power of the two-sample t-test increases with increasing values 
  # of Type I error:

  power <- tTestPower(20, sample.type = "two.sample", delta.over.sigma = 0.5, 
    alpha = c(0.001, 0.01, 0.05, 0.1)) 

  round(power, 2) 
  #[1] 0.03 0.14 0.34 0.46

  #==========

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), determine how 
  # adding another four months of observations to increase the sample size from 
  # 4 to 8 for any one particular compliance well will affect the power of a 
  # one-sample t-test that compares the mean for the well with the MCL of 
  # 7 ppb.  Use alpha = 0.01, assume an upper one-sided alternative 
  # (i.e., compliance well mean larger than 7 ppb), and assume a scaled 
  # difference of 2.  (The data are stored in EPA.09.Ex.21.1.aldicarb.df.) 
  # Note that the power changes from 49% to 98% by increasing the sample size 
  # from 4 to 8.

  tTestPower(n.or.n1 = c(4, 8), delta.over.sigma = 2, alpha = 0.01, 
    sample.type = "one.sample", alternative = "greater")
  #[1] 0.4865800 0.9835401

  #==========

  # Clean up
  #---------
  rm(power)



