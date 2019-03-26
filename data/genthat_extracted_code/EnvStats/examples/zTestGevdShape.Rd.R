library(EnvStats)


### Name: zTestGevdShape
### Title: Test Whether the Shape Parameter of a Generalized Extreme Value
###   Distribution is Equal to 0
### Aliases: zTestGevdShape
### Keywords: htest models

### ** Examples

  # Generate 25 observations from a generalized extreme value distribution with 
  # parameters location=2, scale=1, and shape=1, and test the null hypothesis 
  # that the shape parameter is equal to 0. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 

  dat <- rgevd(25, location = 2, scale = 1, shape = 1) 

  zTestGevdShape(dat) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 shape = 0
  #
  #Alternative Hypothesis:          True shape is not equal to 0
  #
  #Test Name:                       Z-test of shape=0 for GEVD
  #
  #Estimated Parameter(s):          shape = 0.6623014
  #
  #Estimation Method:               Unbiased pwme
  #
  #Data:                            dat
  #
  #Sample Size:                     25
  #
  #Test Statistic:                  z = 4.412206
  #
  #P-value:                         1.023225e-05

  #----------

  # Clean up
  #---------
  rm(dat)



