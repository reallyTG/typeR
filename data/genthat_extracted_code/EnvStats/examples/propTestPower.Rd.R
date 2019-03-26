library(EnvStats)


### Name: propTestPower
### Title: Compute the Power of a One- or Two-Sample Proportion Test
### Aliases: propTestPower
### Keywords: design htest models

### ** Examples

  # Look at how the power of the one-sample proportion test 
  # increases with increasing sample size:

  seq(20, 50, by=10) 
  #[1] 20 30 40 50 

  power <- propTestPower(n.or.n1 = seq(20, 50, by=10), 
    p.or.p1 = 0.7, p0 = 0.5) 

  round(power, 2) 
  #[1] 0.43 0.60 0.73 0.83

  #----------

  # Repeat the last example, but compute the power based on 
  # the exact test instead of the approximation. 
  # Note that the significance level varies with sample size and 
  # never attains the requested level of 0.05.

  prop.test.list <- propTestPower(n.or.n1 = seq(20, 50, by=10), 
    p.or.p1 = 0.7, p0 = 0.5, approx=FALSE) 

  lapply(prop.test.list, round, 2) 
  #$power: 
  #[1] 0.42 0.59 0.70 0.78 
  #
  #$alpha: 
  #[1] 0.04 0.04 0.04 0.03 
  #
  #$q.critical.lower: 
  #[1] 5 9 13 17 
  #
  #$q.critical.upper: 
  #[1] 14 20 26 32

  #==========

  # Look at how the power of the two-sample proportion test 
  # increases with increasing difference between the two 
  # population proportions:

  seq(0.5, 0.1, by=-0.1) 
  #[1] 0.5 0.4 0.3 0.2 0.1 

  power <- propTestPower(30, sample.type = "two", 
    p.or.p1 = seq(0.5, 0.1, by=-0.1)) 
  #Warning message:
  #In propTestPower(30, sample.type = "two", p.or.p1 = seq(0.5, 0.1,  :
  #The sample sizes 'n1' and 'n2' are too small, relative to the given 
  # values of 'p1' and 'p2', for the normal approximation to work well 
  # for the following element indices:
  #         5 

  round(power, 2) 
  #[1] 0.05 0.08 0.26 0.59 0.90

  #----------

  # Look at how the power of the two-sample proportion test 
  # increases with increasing values of Type I error:

  power <- propTestPower(30, sample.type = "two", 
    p.or.p1 = 0.7, 
    alpha = c(0.001, 0.01, 0.05, 0.1)) 

  round(power, 2) 
  #[1] 0.02 0.10 0.26 0.37

  #==========

  # Clean up
  #---------
  rm(power, prop.test.list)

  #==========

  # Modifying the example on pages 8-5 to 8-7 of USEPA (1989b), 
  # determine how adding another 20 observations to the background 
  # well to increase the sample size from 24 to 44 will affect the 
  # power of detecting a difference in the proportion of detects of 
  # cadmium between the background and compliance wells.  Set the 
  # compliance well to "group 1" and set the background well to 
  # "group 2".  Assume the true probability of a "detect" at the 
  # background well is 1/3, set the probability of a "detect" at the 
  # compliance well to 0.4, use a 5% significance level, and use the 
  # upper one-sided alternative (probability of a "detect" at the 
  # compliance well is greater than the probability of a "detect" at 
  # the background well). 
  # (The original data are stored in EPA.89b.cadmium.df.) 
  #
  # Note that the power does increase (from 9% to 12%), but is relatively 
  # very small.

  EPA.89b.cadmium.df
  #   Cadmium.orig Cadmium Censored  Well.type
  #1           0.1   0.100    FALSE Background
  #2          0.12   0.120    FALSE Background
  #3           BDL   0.000     TRUE Background
  # ..........................................
  #86          BDL   0.000     TRUE Compliance
  #87          BDL   0.000     TRUE Compliance
  #88          BDL   0.000     TRUE Compliance


  p.hat.back <- with(EPA.89b.cadmium.df, 
    mean(!Censored[Well.type=="Background"])) 

  p.hat.back 
  #[1] 0.3333333 

  p.hat.comp <- with(EPA.89b.cadmium.df, 
    mean(!Censored[Well.type=="Compliance"])) 

  p.hat.comp 
  #[1] 0.375 

  n.back <- with(EPA.89b.cadmium.df, 
    sum(Well.type == "Background")) 

  n.back 
  #[1] 24 

  n.comp <- with(EPA.89b.cadmium.df, 
    sum(Well.type == "Compliance")) 

  n.comp 
  #[1] 64 

  propTestPower(n.or.n1 = n.comp, 
    p.or.p1 = 0.4, 
    n2 = c(n.back, 44), p0.or.p2 = p.hat.back, 
    alt="greater", sample.type="two") 
  #[1] 0.08953013 0.12421135

  #----------

  # Clean up
  #---------
  rm(p.hat.back, p.hat.comp, n.back, n.comp)



