library(EnvStats)


### Name: plot.permutationTest
### Title: Plot Results of Permutation Test
### Aliases: plot.permutationTest
### Keywords: plot

### ** Examples

  # Create an object of class "permutationTest", then print it and plot it.
  # (Note:  the call to set.seed() allows you to reproduce this example.) 
  #------------------------------------------------------------------------

  set.seed(23) 

  dat <- rlogis(10, location = 7, scale = 2) 

  permutationTest.obj <- oneSamplePermutationTest(dat, mu = 5, 
    alternative = "greater", exact = TRUE) 

  mode(permutationTest.obj) 
  #[1] "list" 

  class(permutationTest.obj) 
  #[1] "permutationTest" 

  names(permutationTest.obj) 
  # [1] "statistic"         "parameters"        "p.value"          
  # [4] "estimate"          "null.value"        "alternative"      
  # [7] "method"            "estimation.method" "sample.size"      
  #[10] "data.name"         "bad.obs"           "stat.dist"        
  #[13] "exact" 

  #==========

  # Print the results of the test 
  #------------------------------
  permutationTest.obj 

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

  #==========

  # Plot the results of the test 
  #-----------------------------
  dev.new()
  plot(permutationTest.obj)

  #==========

  # Extract the test statistic
  #---------------------------

  permutationTest.obj$statistic
  #Sum(x - 5) 
  #  49.77294

  #==========

  # Clean up
  #---------
  rm(permutationTest.obj)
  graphics.off()



