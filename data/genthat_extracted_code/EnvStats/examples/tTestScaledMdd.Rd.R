library(EnvStats)


### Name: tTestScaledMdd
### Title: Scaled Minimal Detectable Difference for One- or Two-Sample
###   t-Test
### Aliases: tTestScaledMdd
### Keywords: distribution design htest

### ** Examples

  # Look at how the scaled minimal detectable difference for the 
  # one-sample t-test increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  scaled.mdd <- tTestScaledMdd(n.or.n1 = 20, power = seq(0.5,0.9,by=0.1)) 

  round(scaled.mdd, 2) 
  #[1] 0.46 0.52 0.59 0.66 0.76

  #----------

  # Repeat the last example, but compute the scaled minimal detectable 
  # differences based on the approximation to the power instead of the 
  # exact formula:

  scaled.mdd <- tTestScaledMdd(n.or.n1 = 20, power = seq(0.5, 0.9, by = 0.1), 
    approx = TRUE) 

  round(scaled.mdd, 2) 
  #[1] 0.47 0.53 0.59 0.66 0.76

  #==========

  # Look at how the scaled minimal detectable difference for the two-sample 
  # t-test decreases with increasing sample size:

  seq(10,50,by=10) 
  #[1] 10 20 30 40 50 

  scaled.mdd <- tTestScaledMdd(seq(10, 50, by = 10), sample.type = "two") 

  round(scaled.mdd, 2) 
  #[1] 1.71 1.17 0.95 0.82 0.73

  #----------

  # Look at how the scaled minimal detectable difference for the two-sample 
  # t-test decreases with increasing values of Type I error:

  scaled.mdd <- tTestScaledMdd(20, alpha = c(0.001, 0.01, 0.05, 0.1), 
    sample.type="two") 

  round(scaled.mdd, 2) 
  #[1] 1.68 1.40 1.17 1.06

  #==========

  # Modifying the example on pages 21-4 to 21-5 of USEPA (2009), 
  # determine the minimal mean level of aldicarb at the third compliance 
  # well necessary to detect a mean level of aldicarb greater than the 
  # MCL of 7 ppb, assuming 90%, 95%, and 99% power.  Use a 99% significance 
  # level and assume an upper one-sided alternative (third compliance well 
  # mean larger than 7).  Use the estimated standard deviation from the 
  # first four months of data to estimate the true population standard 
  # deviation in order to determine the minimal detectable difference based 
  # on the computed scaled minimal detectable difference, then use this 
  # minimal detectable difference to determine the mean level of aldicarb 
  # necessary to detect a difference.  (The data are stored in 
  # EPA.09.Ex.21.1.aldicarb.df.) 
  #
  # Note that the scaled minimal detectable difference changes from 3.4 to 
  # 3.9 to 4.7 as the power changes from 90% to 95% to 99%.  Thus, the 
  # minimal detectable difference changes from 7.2 to 8.1 to 9.8, and the 
  # minimal mean level of aldicarb changes from 14.2 to 15.1 to 16.8.

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

  scaled.mdd <- tTestScaledMdd(n.or.n1 = 4, alpha = 0.01, 
    power = c(0.90, 0.95, 0.99), sample.type="one", alternative="greater") 

  scaled.mdd 
  #[1] 3.431501 3.853682 4.668749

  mdd <- scaled.mdd * sigma 
  mdd 
  #[1] 7.210917 8.098083 9.810856

  minimal.mean <- mdd + 7 

  minimal.mean 
  #[1] 14.21092 15.09808 16.81086


  #==========

  # Clean up
  #---------
  rm(scaled.mdd, sigma, mdd, minimal.mean)



