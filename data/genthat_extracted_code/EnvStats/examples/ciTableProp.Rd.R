library(EnvStats)


### Name: ciTableProp
### Title: Table of Confidence Intervals for Proportion or Difference
###   Between Two Proportions
### Aliases: ciTableProp
### Keywords: distribution design htest

### ** Examples

  # Reproduce Table 1 in Bacchetti (2010).  This involves planning a study with 
  # n1 = n2 = 935 subjects per group, where Group 1 is the control group and 
  # Group 2 is the treatment group.  The outcome in the study is proportion of 
  # subjects with serious outcomes or death.  A negative value for the difference 
  # in proportions between groups (Group 2 proportion - Group 1 proportion) 
  # indicates the treatment group has a better outcome.  In this table, the 
  # proportion of subjects in Group 1 with serious outcomes or death is set 
  # to 3%, 6.5%, and 12%, and the difference in proportions between the two 
  # groups is set to -2.8 percentage points, -1.4 percentage points, and 0.

  ciTableProp(n1 = 935, p1.hat = c(0.03, 0.065, 0.12), n2 = 935, 
    p2.hat.minus.p1.hat = c(-0.028, -0.014, 0), digits = 3)
  #                  Diff=-0.028      Diff=-0.014           Diff=0
  #P1.hat=0.030 [-0.040, -0.015] [-0.029,  0.001] [-0.015,  0.015]
  #P1.hat=0.065 [-0.049, -0.007] [-0.036,  0.008] [-0.022,  0.022]
  #P1.hat=0.120 [-0.057,  0.001] [-0.044,  0.016] [-0.029,  0.029]

  #==========

  # Show how the returned data frame has to be modified for cases of small 
  # sample sizes where not all user-supplied differenes are possible.

  ciTableProp(n1 = 5, n2 = 5, p1.hat = c(0.3, 0.6, 0.12), p2.hat = c(0.2, 0.1, 0))
  #           Diff            CI Diff            CI Diff            CI
  #P1.hat=0.4  0.2 [-0.61, 1.00]  0.0 [-0.61, 0.61]    0 [-0.61, 0.61]
  #P1.hat=0.6  0.2 [-0.55, 0.95]  0.2 [-0.55, 0.95]    0 [-0.61, 0.61]
  #P1.hat=0.2  0.2 [-0.55, 0.95]  0.2 [-0.55, 0.95]    0 [-0.50, 0.50]

  #==========

  # Suppose we are planning a study to compare the proportion of nondetects at 
  # a background and downgradient well, and we can use ciTableProp to look how 
  # the confidence interval for the difference between the two proportions using 
  # say 36 quarterly samples at each well varies with the observed estimated 
  # proportions.  Here we'll let the argument "p1.hat" denote the proportion of 
  # nondetects observed at the downgradient well and set this equal to 
  # 20%, 40% and 60%.  The argument "p2.hat.minus.p1.hat" represents the proportion 
  # of nondetects at the background well minus the proportion of nondetects at the 
  # downgradient well.

  ciTableProp(n1 = 36, p1.hat = c(0.2, 0.4, 0.6), n2 = 36, 
    p2.hat.minus.p1.hat = c(0.3, 0.15, 0))
  #                Diff=0.31     Diff=0.14        Diff=0
  #P1.hat=0.19 [ 0.07, 0.54] [-0.09, 0.37] [-0.18, 0.18]
  #P1.hat=0.39 [ 0.06, 0.55] [-0.12, 0.39] [-0.23, 0.23]
  #P1.hat=0.61 [ 0.09, 0.52] [-0.10, 0.38] [-0.23, 0.23]

  # We see that even if the observed difference in the proportion of nondetects 
  # is about 15 percentage points, all of the confidence intervals for the 
  # difference between the proportions of nondetects at the two wells contain 0, 
  # so if a difference of 15 percentage points is important to substantiate, we 
  # may need to increase our sample sizes.



