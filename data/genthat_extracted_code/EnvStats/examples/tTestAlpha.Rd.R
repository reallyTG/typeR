library(EnvStats)


### Name: tTestAlpha
### Title: Type I Error Level for a One- or Two-Sample t-Test
### Aliases: tTestAlpha
### Keywords: distribution design htest

### ** Examples

  # Look at how the required Type I error level for the one-sample t-test 
  # decreases with increasing sample size.  Set the power to 80% and 
  # the scaled difference to 0.5.

  seq(5, 30, by = 5) 
  #[1] 5 10 15 20 25 30 

  alpha <- tTestAlpha(n.or.n1 = seq(5, 30, by = 5), 
    power = 0.8, delta.over.sigma = 0.5) 

  round(alpha, 2) 
  #[1] 0.65 0.45 0.29 0.18 0.11 0.07


  #----------


  # Repeat the last example, but use the approximation.
  # Note how the approximation underestimates the power 
  # for the smaller sample sizes.
  #----------------------------------------------------

  alpha <- tTestAlpha(n.or.n1 = seq(5, 30, by = 5), 
    power = 0.8, delta.over.sigma = 0.5, approx = TRUE) 

  round(alpha, 2)
  #[1] 0.63 0.46 0.30 0.18 0.11 0.07


  #----------


  # Look at how the required Type I error level for the two-sample 
  # t-test decreases with increasing scaled difference.  Use 
  # a power of 90% and a sample size of 10 in each group.

  seq(0.5, 2, by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  alpha <- tTestAlpha(10, sample.type = "two.sample", 
    power = 0.9, delta.over.sigma = seq(0.5, 2, by = 0.5)) 

  round(alpha, 2) 
  #[1] 0.82 0.35 0.06 0.01


  #----------


  # Look at how the required Type I error level for the two-sample 
  # t-test increases with increasing values of required power.  Use 
  # a sample size of 20 for each group and a scaled difference of 
  # 1.

  alpha <- tTestAlpha(20, sample.type = "two.sample", delta.over.sigma = 1, 
    power = c(0.8, 0.9, 0.95)) 

  round(alpha, 2)
  #[1] 0.03 0.07 0.14
 

  #----------


  # Clean up
  #---------
  rm(alpha)



