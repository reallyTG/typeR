library(EnvStats)


### Name: twoSampleLinearRankTest
### Title: Two-Sample Linear Rank Test to Detect a Difference Between Two
###   Distributions
### Aliases: twoSampleLinearRankTest
### Keywords: htest nonparametric regression

### ** Examples

  # Generate 15 observations from a normal distribution with parameters 
  # mean=3 and sd=1.  Call these the observations from the reference group. 
  # Generate 10 observations from a normal distribution with parameters 
  # mean=3.5 and sd=1.  Call these the observations from the treatment group. 
  # Compare the results of calling wilcox.test to those of calling 
  # twoSampleLinearRankTest with test="normal.scores".
  # (The call to set.seed allows you to reproduce this example.)

  set.seed(346) 
  x <- rnorm(15, mean = 3) 
  y <- rnorm(10, mean = 3.5) 

  wilcox.test(x, y) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 location shift = 0
  #
  #Alternative Hypothesis:          True location shift is not equal to 0
  #
  #Test Name:                       Wilcoxon rank sum test
  #
  #Data:                            x and y
  #
  #Test Statistic:                  W = 32
  #
  #P-value:                         0.0162759


  twoSampleLinearRankTest(x, y, test = "normal.scores")

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 Fy(t) = Fx(t)
  #
  #Alternative Hypothesis:          Fy(t) != Fx(t) for at least one t
  #
  #Test Name:                       Two-Sample Linear Rank Test:
  #                                 Normal Scores Test
  #                                 Based on Normal Approximation
  #
  #Data:                            x = x
  #                                 y = y
  #
  #Sample Sizes:                    nx = 15
  #                                 ny = 10
  #
  #Test Statistic:                  z = -2.431099
  #
  #P-value:                         0.01505308

  #----------

  # Clean up
  #---------
  rm(x, y)

  #==========

  # Following Example 6.6 on pages 6.22-6.26 of USEPA (1994b), perform the 
  # Wilcoxon Rank Sum test for the TcCB data (stored in EPA.94b.tccb.df).  
  # There are m=47 observations from the reference area and n=77 observations 
  # from the cleanup unit.  Then compare the results using the other available 
  # linear rank tests.  Note that Mood's median test yields a p-value less 
  # than 0.10, while the other tests yield non-significant p-values.  
  # In this case, Mood's median test is picking up the residual contamination 
  # in the cleanup unit. (See the example in the help file for quantileTest.)

  names(EPA.94b.tccb.df) 
  #[1] "TcCB.orig" "TcCB"      "Censored"  "Area" 

  summary(EPA.94b.tccb.df$Area) 
  #  Cleanup Reference 
  #       77        47

  with(EPA.94b.tccb.df, 
    twoSampleLinearRankTest(TcCB[Area=="Cleanup"], TcCB[Area=="Reference"]))

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 Fy(t) = Fx(t)
  #
  #Alternative Hypothesis:          Fy(t) != Fx(t) for at least one t
  #
  #Test Name:                       Two-Sample Linear Rank Test:
  #                                 Wilcoxon Rank Sum Test
  #                                 Based on Normal Approximation
  #
  #Data:                            x = TcCB[Area == "Cleanup"]  
  #                                 y = TcCB[Area == "Reference"]
  #
  #Sample Sizes:                    nx = 77
  #                                 ny = 47
  #
  #Test Statistic:                  z = -1.171872
  #
  #P-value:                         0.2412485

  with(EPA.94b.tccb.df, 
    twoSampleLinearRankTest(TcCB[Area=="Cleanup"], 
      TcCB[Area=="Reference"], test="normal.scores"))$p.value 
  #[1] 0.3399484 

  with(EPA.94b.tccb.df, 
    twoSampleLinearRankTest(TcCB[Area=="Cleanup"], 
      TcCB[Area=="Reference"], test="moods.median"))$p.value 
  #[1] 0.09707393

  with(EPA.94b.tccb.df, 
    twoSampleLinearRankTest(TcCB[Area=="Cleanup"], 
      TcCB[Area=="Reference"], test="savage.scores"))$p.value 
  #[1] 0.2884351



