library(EnvStats)


### Name: oneSamplePermutationTest
### Title: Fisher's One-Sample Randomization (Permutation) Test for
###   Location
### Aliases: oneSamplePermutationTest
### Keywords: htest models

### ** Examples

  # Generate 10 observations from a logistic distribution with parameters 
  # location=7 and scale=2, and test the null hypothesis that the true mean 
  # is equal to 5 against the alternative that the true mean is greater than 5. 
  # Use the exact permutation distribution. 
  # (Note: the call to set.seed() allows you to reproduce this example).

  set.seed(23) 

  dat <- rlogis(10, location = 7, scale = 2) 

  test.list <- oneSamplePermutationTest(dat, mu = 5, 
    alternative = "greater", exact = TRUE) 

  # Print the results of the test 
  #------------------------------
  test.list 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 Mean (Median) = 5
  #
  #Alternative Hypothesis:          True Mean (Median) is greater than 5
  #
  #Test Name:                       One-Sample Permutation Test
  #                                 (Exact)
  #
  #Estimated Parameter(s):          Mean = 9.977294
  #
  #Data:                            dat
  #
  #Sample Size:                     10
  #
  #Test Statistic:                  Sum(x - 5) = 49.77294
  #
  #P-value:                         0.001953125


  # Plot the results of the test 
  #-----------------------------
  dev.new()
  plot(test.list)

  #==========

  # The guidance document "Supplemental Guidance to RAGS: Calculating the 
  # Concentration Term" (USEPA, 1992d) contains an example of 15 observations 
  # of chromium concentrations (mg/kg) which are assumed to come from a 
  # lognormal distribution.  These data are stored in the vector 
  # EPA.92d.chromium.vec.  Here, we will use the permutation test to test 
  # the null hypothesis that the mean (median) of the log-transformed chromium 
  # concentrations is less than or equal to log(100 mg/kg) vs. the alternative 
  # that it is greater than log(100 mg/kg).  Note that we *cannot* use the 
  # permutation test to test a hypothesis about the mean on the original scale 
  # because the data are not assumed to be symmetric about some mean, they are 
  # assumed to come from a lognormal distribution.
  #
  # We will sample from the permutation distribution.
  # (Note: setting the argument seed=542 allows you to reproduce this example).

  test.list <- oneSamplePermutationTest(log(EPA.92d.chromium.vec), 
    mu = log(100), alternative = "greater", seed = 542) 

  test.list

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 Mean (Median) = 4.60517
  #
  #Alternative Hypothesis:          True Mean (Median) is greater than 4.60517
  #
  #Test Name:                       One-Sample Permutation Test
  #                                 (Based on Sampling
  #                                 Permutation Distribution
  #                                 5000 Times)
  #
  #Estimated Parameter(s):          Mean = 4.378636
  #
  #Data:                            log(EPA.92d.chromium.vec)
  #
  #Sample Size:                     15
  #
  #Test Statistic:                  Sum(x - 4.60517) = -3.398017
  #
  #P-value:                         0.7598


  # Plot the results of the test 
  #-----------------------------
  dev.new()
  plot(test.list)

  #----------

  # Clean up
  #---------
  rm(test.list)
  graphics.off()



