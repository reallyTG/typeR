library(EnvStats)


### Name: ciTableMean
### Title: Table of Confidence Intervals for Mean or Difference Between Two
###   Means
### Aliases: ciTableMean
### Keywords: distribution design htest

### ** Examples

  # Show how potential confidence intervals for the difference between two means 
  # will look assuming standard deviations of 1, 2, or 3, differences between 
  # the two means of 2, 1, or 0, and a sample size of 10 in each group.

  ciTableMean()
  #          Diff=2      Diff=1      Diff=0
  #SD=1 [ 1.1, 2.9] [ 0.1, 1.9] [-0.9, 0.9]
  #SD=2 [ 0.1, 3.9] [-0.9, 2.9] [-1.9, 1.9]
  #SD=3 [-0.8, 4.8] [-1.8, 3.8] [-2.8, 2.8]

  #==========

  # Show how a potential confidence interval for a mean will look assuming 
  # standard deviations of 1, 2, or 5, a sample mean of 5, 3, or 1, and 
  # a sample size of 15.

  ciTableMean(n1 = 15, diff.or.mean = c(5, 3, 1), SD = c(1, 2, 5), sample.type = "one")
  #          Mean=5      Mean=3      Mean=1
  #SD=1 [ 4.4, 5.6] [ 2.4, 3.6] [ 0.4, 1.6]
  #SD=2 [ 3.9, 6.1] [ 1.9, 4.1] [-0.1, 2.1]
  #SD=5 [ 2.2, 7.8] [ 0.2, 5.8] [-1.8, 3.8]

  #==========

  # The data frame EPA.09.Ex.16.1.sulfate.df contains sulfate concentrations
  # (ppm) at one background and one downgradient well. The estimated
  # mean and standard deviation for the background well are 536 and 27 ppm,
  # respectively, based on a sample size of n = 8 quarterly samples taken over 
  # 2 years.  A two-sided 95% confidence interval for this mean is [514, 559], 
  # which has a  half-width of 23 ppm.
  #
  # The estimated mean and standard deviation for the downgradient well are 
  # 608 and 18 ppm, respectively, based on a sample size of n = 6 quarterly 
  # samples.  A two-sided 95% confidence interval for the difference between 
  # this mean and the background mean is [44, 100] ppm.
  #
  # Suppose we want to design a future sampling program and are interested in 
  # the size of the confidence interval for the difference between the two means.  
  # We will use ciTableMean to generate a table of possible confidence intervals 
  # by varying the assumed standard deviation and assumed differences between 
  # the means.


  # Look at the data
  #-----------------

  EPA.09.Ex.16.1.sulfate.df
  #   Month Year    Well.type Sulfate.ppm
  #1    Jan 1995   Background         560
  #2    Apr 1995   Background         530
  #3    Jul 1995   Background         570
  #4    Oct 1995   Background         490
  #5    Jan 1996   Background         510
  #6    Apr 1996   Background         550
  #7    Jul 1996   Background         550
  #8    Oct 1996   Background         530
  #9    Jan 1995 Downgradient          NA
  #10   Apr 1995 Downgradient          NA
  #11   Jul 1995 Downgradient         600
  #12   Oct 1995 Downgradient         590
  #13   Jan 1996 Downgradient         590
  #14   Apr 1996 Downgradient         630
  #15   Jul 1996 Downgradient         610
  #16   Oct 1996 Downgradient         630


  # Compute the estimated mean and standard deviation for the 
  # background well.
  #-----------------------------------------------------------

  Sulfate.back <- with(EPA.09.Ex.16.1.sulfate.df,
    Sulfate.ppm[Well.type == "Background"])

  enorm(Sulfate.back, ci = TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 536.2500
  #                                 sd   =  26.6927
  #
  #Estimation Method:               mvue
  #
  #Data:                            Sulfate.back
  #
  #Sample Size:                     8
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 513.9343
  #                                 UCL = 558.5657


  # Compute the estimated mean and standard deviation for the 
  # downgradient well.
  #----------------------------------------------------------

  Sulfate.down <- with(EPA.09.Ex.16.1.sulfate.df,
    Sulfate.ppm[Well.type == "Downgradient"])

  enorm(Sulfate.down, ci = TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 608.33333
  #                                 sd   =  18.34848
  #
  #Estimation Method:               mvue
  #
  #Data:                            Sulfate.down
  #
  #Sample Size:                     6
  #
  #Number NA/NaN/Inf's:             2
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 589.0778
  #                                 UCL = 627.5889


  # Compute the estimated difference between the means and the confidence 
  # interval for the difference:
  #----------------------------------------------------------------------

  t.test(Sulfate.down, Sulfate.back, var.equal = TRUE)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 difference in means = 0
  #
  #Alternative Hypothesis:          True difference in means is not equal to 0
  #
  #Test Name:                        Two Sample t-test
  #
  #Estimated Parameter(s):          mean of x = 608.3333
  #                                 mean of y = 536.2500
  #
  #Data:                            Sulfate.down and Sulfate.back
  #
  #Test Statistic:                  t = 5.660985
  #
  #Test Statistic Parameter:        df = 12
  #
  #P-value:                         0.0001054306
  #
  #95% Confidence Interval:         LCL = 44.33974
  #                                 UCL = 99.82693


  # Use ciTableMean to look how the confidence interval for the difference
  # between the background and downgradient means in a future study using eight
  # quarterly samples at each well varies with assumed value of the pooled standard
  # deviation and the observed difference between the sample means. 
  #--------------------------------------------------------------------------------

  # Our current estimate of the pooled standard deviation is 24 ppm:

  summary(lm(Sulfate.ppm ~ Well.type, data = EPA.09.Ex.16.1.sulfate.df))$sigma
  #[1] 23.57759

  # We can see that if this is overly optimistic and in our next study the 
  # pooled standard deviation is around 50 ppm, then if the observed difference 
  # between the means is 50 ppm, the lower end of the confidence interval for 
  # the difference between the two means will include 0, so we may want to 
  # increase our sample size.

  ciTableMean(n1 = 8, n2 = 8, diff = c(100, 50, 0), SD = c(15, 25, 50), digits = 0)

  #        Diff=100    Diff=50     Diff=0
  #SD=15 [ 84, 116] [ 34,  66] [-16,  16]
  #SD=25 [ 73, 127] [ 23,  77] [-27,  27]
  #SD=50 [ 46, 154] [ -4, 104] [-54,  54]
  
  #==========

  # Clean up
  #---------
  rm(Sulfate.back, Sulfate.down)



