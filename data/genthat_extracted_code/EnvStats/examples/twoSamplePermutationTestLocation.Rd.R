library(EnvStats)


### Name: twoSamplePermutationTestLocation
### Title: Two-Sample or Paired-Sample Randomization (Permutation) Test for
###   Location
### Aliases: twoSamplePermutationTestLocation
### Keywords: htest models

### ** Examples

  # Generate 10 observations from a lognormal distribution with parameters 
  # mean=5 and cv=2, and and 20 observations from a lognormal distribution with 
  # parameters mean=10 and cv=2.  Test the null hypothesis that the means of the 
  # two distributions are the same against the alternative that the mean for 
  # group 1 is less than the mean for group 2. 
  # (Note: the call to set.seed allows you to reproduce the same data 
  # (dat1 and dat2), and setting the argument seed=732 in the call to 
  # twoSamplePermutationTestLocation() lets you reproduce this example by 
  # getting the same sample from the permutation distribution).

  set.seed(256) 
  dat1 <- rlnormAlt(10, mean = 5, cv = 2) 
  dat2 <- rlnormAlt(20, mean = 10, cv = 2) 

  test.list <- twoSamplePermutationTestLocation(dat1, dat2, 
    alternative = "less", seed = 732) 

  # Print the results of the test 
  #------------------------------
  test.list 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 mu.x-mu.y = 0
  #
  #Alternative Hypothesis:          True mu.x-mu.y is less than 0
  #
  #Test Name:                       Two-Sample Permutation Test
  #                                 Based on Differences in Means
  #                                 (Based on Sampling
  #                                 Permutation Distribution
  #                                 5000 Times)
  #
  #Estimated Parameter(s):          mean of x =  2.253439
  #                                 mean of y = 11.825430
  #
  #Data:                            x = dat1
  #                                 y = dat2
  #
  #Sample Sizes:                    nx = 10
  #                                 ny = 20
  #
  #Test Statistic:                  mean.x - mean.y = -9.571991
  #
  #P-value:                         0.001


  # Plot the results of the test 
  #-----------------------------
  dev.new()
  plot(test.list)

  #==========

  # The guidance document "Statistical Methods for Evaluating the Attainment of 
  # Cleanup Standards, Volume 3: Reference-Based Standards for Soils and Solid 
  # Media" (USEPA, 1994b, pp. 6.22-6.25) contains observations of 
  # 1,2,3,4-Tetrachlorobenzene (TcCB) in ppb at a Reference Area and a Cleanup Area.  
  # These data are stored in the data frame EPA.94b.tccb.df.  Use the 
  # two-sample permutation test to test for a difference in means between the 
  # two areas vs. the alternative that the mean in the Cleanup Area is greater.  
  # Do the same thing for the medians.
  #
  # The permutation test based on comparing means shows a significant differnce, 
  # while the one based on comparing medians does not.


  # First test for a difference in the means.
  #------------------------------------------

  mean.list <- with(EPA.94b.tccb.df, 
    twoSamplePermutationTestLocation(
      TcCB[Area=="Cleanup"], TcCB[Area=="Reference"], 
      alternative = "greater", seed = 47)) 

  mean.list

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 mu.x-mu.y = 0
  #
  #Alternative Hypothesis:          True mu.x-mu.y is greater than 0
  #
  #Test Name:                       Two-Sample Permutation Test
  #                                 Based on Differences in Means
  #                                 (Based on Sampling
  #                                 Permutation Distribution
  #                                 5000 Times)
  #
  #Estimated Parameter(s):          mean of x = 3.9151948
  #                                 mean of y = 0.5985106
  #
  #Data:                            x = TcCB[Area == "Cleanup"]  
  #                                 y = TcCB[Area == "Reference"]
  #
  #Sample Sizes:                    nx = 77
  #                                 ny = 47
  #
  #Test Statistic:                  mean.x - mean.y = 3.316684
  #
  #P-value:                         0.0206

  dev.new()
  plot(mean.list)


  #----------

  # Now test for a difference in the medians.
  #------------------------------------------

  median.list <- with(EPA.94b.tccb.df, 
    twoSamplePermutationTestLocation(
      TcCB[Area=="Cleanup"], TcCB[Area=="Reference"], 
      fcn = "median", alternative = "greater", seed = 47)) 

  median.list

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 mu.x-mu.y = 0
  #
  #Alternative Hypothesis:          True mu.x-mu.y is greater than 0
  #
  #Test Name:                       Two-Sample Permutation Test
  #                                 Based on Differences in Medians
  #                                 (Based on Sampling
  #                                 Permutation Distribution
  #                                 5000 Times)
  #
  #Estimated Parameter(s):          median of x = 0.43
  #                                 median of y = 0.54
  #
  #Data:                            x = TcCB[Area == "Cleanup"]  
  #                                 y = TcCB[Area == "Reference"]
  #
  #Sample Sizes:                    nx = 77
  #                                 ny = 47
  #
  #Test Statistic:                  median.x - median.y = -0.11
  #
  #P-value:                         0.936

  dev.new()
  plot(median.list)

  #==========

  # Clean up
  #---------
  rm(test.list, mean.list, median.list)
  graphics.off()



