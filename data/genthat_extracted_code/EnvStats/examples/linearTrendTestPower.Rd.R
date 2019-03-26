library(EnvStats)


### Name: linearTrendTestPower
### Title: Power of a t-Test for Linear Trend
### Aliases: linearTrendTestPower
### Keywords: distribution design htest

### ** Examples

  # Look at how the power of the t-test for zero slope increases with increasing 
  # sample size:

  seq(5, 30, by = 5) 
  #[1] 5 10 15 20 25 30 

  power <- linearTrendTestPower(n = seq(5, 30, by = 5), slope.over.sigma = 0.1) 

  round(power, 2) 
  #[1] 0.06 0.13 0.34 0.68 0.93 1.00

  #----------

  # Repeat the last example, but compute the approximate power instead of the 
  # exact:

  power <- linearTrendTestPower(n = seq(5, 30, by = 5), slope.over.sigma = 0.1, 
    approx = TRUE) 

  round(power, 2) 
  #[1] 0.05 0.11 0.32 0.68 0.93 0.99

  #----------

  # Look at how the power of the t-test for zero slope increases with increasing 
  # scaled slope:

  seq(0.05, 0.2, by = 0.05) 
  #[1] 0.05 0.10 0.15 0.20 

  power <- linearTrendTestPower(15, slope.over.sigma = seq(0.05, 0.2, by = 0.05)) 

  round(power, 2) 
  #[1] 0.12 0.34 0.64 0.87

  #----------

  # Look at how the power of the t-test for zero slope increases with increasing 
  # values of Type I error:

  power <- linearTrendTestPower(20, slope.over.sigma = 0.1, 
    alpha = c(0.001, 0.01, 0.05, 0.1)) 

  round(power, 2) 
  #[1] 0.14 0.41 0.68 0.80

  #----------

  # Show that for a simple regression model, you get a greater power of detecting 
  # a non-zero slope if you take all the observations at two endpoints, rather than 
  # spreading the observations evenly between two endpoints. 
  # (Note: This design usually cannot work with environmental monitoring data taken 
  # over time since usually observations taken close together in time are not 
  # independent.)

  linearTrendTestPower(x = 1:10, slope.over.sigma = 0.1) 
  #[1] 0.1265976


  linearTrendTestPower(x = c(rep(1, 5), rep(10, 5)), slope.over.sigma = 0.1) 
  #[1] 0.2413823

  #==========

  # Clean up
  #---------
  rm(power)



