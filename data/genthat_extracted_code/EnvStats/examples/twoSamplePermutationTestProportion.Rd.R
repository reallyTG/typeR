library(EnvStats)


### Name: twoSamplePermutationTestProportion
### Title: Randomization (Permutation) Test to Compare Two Proportions
###   (Fisher's Exact Test)
### Aliases: twoSamplePermutationTestProportion
### Keywords: htest models

### ** Examples

  # Generate 10 observations from a binomial distribution with parameters 
  # size=1 and prob=0.3, and 20 observations from a binomial distribution 
  # with parameters size=1 and prob=0.5.  Test the null hypothesis that the 
  # probability of "success" for the two distributions is the same against the 
  # alternative that the probability of "success" for group 1 is less than 
  # the probability of "success" for group 2. 
  # (Note: the call to set.seed allows you to reproduce this example).

  set.seed(23) 
  dat1 <- rbinom(10, size = 1, prob = 0.3) 
  dat2 <- rbinom(20, size = 1, prob = 0.5) 

  test.list <- twoSamplePermutationTestProportion(
    dat1, dat2, alternative = "less") 

  #----------

  # Print the results of the test 
  #------------------------------
  test.list 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 p.x - p.y = 0
  #
  #Alternative Hypothesis:          True p.x - p.y is less than 0
  #
  #Test Name:                       Two-Sample Permutation Test
  #                                 Based on Differences in Proportions
  #                                 (Fisher's Exact Test)
  #
  #Estimated Parameter(s):          p.hat.x = 0.60
  #                                 p.hat.y = 0.65
  #
  #Data:                            x = dat1
  #                                 y = dat2
  #
  #Sample Sizes:                    nx = 10
  #                                 ny = 20
  #
  #Test Statistic:                  p.hat.x - p.hat.y = -0.05
  #
  #P-value:                         0.548026

  #----------

  # Plot the results of the test 
  #------------------------------
  dev.new()
  plot(test.list)

  #----------

  # Compare to the results of fisher.test
  #--------------------------------------
  x11 <- sum(dat1)
  x21 <- length(dat1) - sum(dat1)
  x12 <- sum(dat2)
  x22 <- length(dat2) - sum(dat2)
  mat <- matrix(c(x11, x12, x21, x22), ncol = 2)
  fisher.test(mat, alternative = "less")

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 odds ratio = 1
  #
  #Alternative Hypothesis:          True odds ratio is less than 1
  #
  #Test Name:                       Fisher's Exact Test for Count Data
  #
  #Estimated Parameter(s):          odds ratio = 0.8135355
  #
  #Data:                            mat
  #
  #P-value:                         0.548026
  #
  #95% Confidence Interval:         LCL = 0.000000
  #                                 UCL = 4.076077

  #==========

  # Rodricks (1992, p. 133) presents data from an experiment by 
  # Graham et al. (1975) in which different groups of rats were exposed to 
  # various concentration levels of ethylene thiourea (ETU), a decomposition 
  # product of a certain class of fungicides that can be found in treated foods.  
  # In the group exposed to a dietary level of 250 ppm of ETU, 16 out of 69 rats 
  # (23%) developed thyroid tumors, whereas in the control group 
  # (no exposure to ETU) only 2 out of 72 (3%) rats developed thyroid tumors.  
  # If we use Fisher's exact test to test the null hypothesis that the proportion 
  # of rats exposed to 250 ppm of ETU who will develop thyroid tumors over their 
  # lifetime is no greater than the proportion of rats not exposed to ETU who will 
  # develop tumors, we get a one-sided upper p-value of 0.0002.  Therefore, we 
  # conclude that the true underlying rate of tumor incidence in the exposed group 
  # is greater than in the control group.
  #
  # The data for this example are stored in Graham.et.al.75.etu.df.

  # Look at the data
  #-----------------

  Graham.et.al.75.etu.df
  #  dose tumors  n proportion
  #1    0      2 72 0.02777778
  #2    5      2 75 0.02666667
  #3   25      1 73 0.01369863
  #4  125      2 73 0.02739726
  #5  250     16 69 0.23188406
  #6  500     62 70 0.88571429

  # Perform the test for a difference in tumor rates
  #-------------------------------------------------

  Num.Tumors <- with(Graham.et.al.75.etu.df, tumors[c(5, 1)])
  Sample.Sizes <- with(Graham.et.al.75.etu.df, n[c(5, 1)]) 

  test.list <- twoSamplePermutationTestProportion( 
    x = Num.Tumors, y = Sample.Sizes, 
    x.and.y="Number Successes and Trials", alternative = "greater") 

  #----------

  # Print the results of the test 
  #------------------------------
  test.list 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 p.x - p.y = 0
  #
  #Alternative Hypothesis:          True p.x - p.y is greater than 0
  #
  #Test Name:                       Two-Sample Permutation Test
  #                                 Based on Differences in Proportions
  #                                 (Fisher's Exact Test)
  #
  #Estimated Parameter(s):          p.hat.x = 0.23188406
  #                                 p.hat.y = 0.02777778
  #
  #Data:                            x = Num.Tumors  
  #                                 n = Sample.Sizes
  #
  #Sample Sizes:                    nx = 69
  #                                 ny = 72
  #
  #Test Statistic:                  p.hat.x - p.hat.y = 0.2041063
  #
  #P-value:                         0.0002186462

  #----------

  # Plot the results of the test 
  #------------------------------
  dev.new()
  plot(test.list)

  #==========

  # Clean up
  #---------
  rm(test.list, x11, x12, x21, x22, mat, Num.Tumors, Sample.Sizes)
  #graphics.off()



