library(EnvStats)


### Name: tTestN
### Title: Sample Size for a One- or Two-Sample t-Test
### Aliases: tTestN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for the one-sample t-test 
  # increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  tTestN(delta.over.sigma = 0.5, power = seq(0.5, 0.9, by = 0.1)) 
  #[1] 18 22 27 34 44

  #----------

  # Repeat the last example, but compute the sample size based on the 
  # approximation to the power instead of the exact method:

  tTestN(delta.over.sigma = 0.5, power = seq(0.5, 0.9, by = 0.1), 
    approx = TRUE) 
  #[1] 18 22 27 34 45

  #==========

  # Look at how the required sample size for the two-sample t-test 
  # decreases with increasing scaled difference:

  seq(0.5, 2,by = 0.5) 
  #[1] 0.5 1.0 1.5 2.0 

  tTestN(delta.over.sigma = seq(0.5, 2, by = 0.5), sample.type = "two") 
  #[1] 105  27  13   8

  #----------

  # Look at how the required sample size for the two-sample t-test decreases 
  # with increasing values of Type I error:

  tTestN(delta.over.sigma = 0.5, alpha = c(0.001, 0.01, 0.05, 0.1), 
    sample.type="two") 
  #[1] 198 145 105  88

  #----------

  # For the two-sample t-test, compare the total sample size required to 
  # detect a scaled difference of 1 for equal sample sizes versus the case 
  # when the sample size for the second group is constrained to be 20.  
  # Assume a 5% significance level and 95% power.  Note that for the case 
  # of equal sample sizes, a total of 54 samples (27+27) are required, 
  # whereas when n2 is constrained to be 20, a total of 62 samples 
  # (42 + 20) are required.

  tTestN(1, sample.type="two") 
  #[1] 27 

  tTestN(1, n2 = 20)
  #$n1
  #[1] 42
  #
  #$n2
  #[1] 20

  #==========

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), determine the 
  # required sample size to detect a mean aldicarb level greater than the MCL 
  # of 7 ppb at the third compliance well with a power of 95%, assuming the 
  # true mean is 10 or 14.  Use the estimated standard deviation from the 
  # first four months of data to estimate the true population standard 
  # deviation, use a Type I error level of alpha=0.01, and assume an 
  # upper one-sided alternative (third compliance well mean larger than 7).  
  # (The data are stored in EPA.09.Ex.21.1.aldicarb.df.) 
  # Note that the required sample size changes from 11 to 5 as the true mean 
  # increases from 10 to 14.


  EPA.09.Ex.21.1.aldicarb.df
  #   Month   Well Aldicarb.ppb
  #1      1 Well.1         19.9
  #2      2 Well.1         29.6
  #3      3 Well.1         18.7
  #4      4 Well.1         24.2
  #5      1 Well.2         23.7
  #6      2 Well.2         21.9
  #7      3 Well.2         26.9
  #8      4 Well.2         26.1
  #9      1 Well.3          5.6
  #10     2 Well.3          3.3
  #11     3 Well.3          2.3
  #12     4 Well.3          6.9

  sigma <- with(EPA.09.Ex.21.1.aldicarb.df, 
    sd(Aldicarb.ppb[Well == "Well.3"]))

  sigma
  #[1] 2.101388

  tTestN(delta.over.sigma = (c(10, 14) - 7)/sigma, 
    alpha = 0.01, sample.type="one", alternative="greater") 
  #[1] 11  5


  # Clean up
  #---------
  rm(sigma)



