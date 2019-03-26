library(EnvStats)


### Name: propTestMdd
### Title: Minimal Detectable Difference Associated with a One- or
###   Two-Sample Proportion Test
### Aliases: propTestMdd
### Keywords: design htest models

### ** Examples

  # Look at how the minimal detectable difference of the one-sample 
  # proportion test increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  mdd <- propTestMdd(n.or.n1 = 50, power = seq(0.5, 0.9, by=0.1)) 

  round(mdd, 2) 
  #[1] 0.14 0.16 0.17 0.19 0.22

  #----------

  # Repeat the last example, but compute the minimal detectable difference 
  # based on the exact test instead of the approximation.  Note that with a 
  # sample size of 50, the largest significance level less than or equal to 
  # 0.05 for the two-sided alternative is 0.03.

  mdd.list <- propTestMdd(n.or.n1 = 50, power = seq(0.5, 0.9, by = 0.1), 
    approx = FALSE) 

  lapply(mdd.list, round, 2) 
  #$delta
  #[1] 0.15 0.17 0.18 0.20 0.23
  #
  #$power
  #[1] 0.5 0.6 0.7 0.8 0.9
  #
  #$alpha
  #[1] 0.03 0.03 0.03 0.03 0.03
  #
  #$q.critical.lower
  #[1] 17 17 17 17 17
  #
  #$q.critical.upper
  #[1] 32 32 32 32 32

  #==========

  # Look at how the minimal detectable difference for the two-sample 
  # proportion test decreases with increasing sample sizes.  Note that for 
  # the specified significance level, power, and true proportion in group 2, 
  # no minimal detectable difference is attainable for a sample size of 10 in 
  # each group.

  seq(10, 50, by=10) 
  #[1] 10 20 30 40 50 

  propTestMdd(n.or.n1 = seq(10, 50, by = 10), p0.or.p2 = 0.5, 
    sample.type = "two", alternative="greater") 
  #[1]        NA 0.4726348 0.4023564 0.3557916 0.3221412
  #Warning messages:
  #1: In propTestMdd(n.or.n1 = seq(10, 50, by = 10), p0.or.p2 = 0.5, 
  #     sample.type = "two",  :
  #  Elements with a missing value (NA) indicate no attainable minimal detectable 
  #    difference for the given values of 'n1', 'n2', 'p2', 'alpha', and 'power'
  #2: In propTestMdd(n.or.n1 = seq(10, 50, by = 10), p0.or.p2 = 0.5, 
  #      sample.type = "two",  :
  #  The sample sizes 'n1' and 'n2' are too small, relative to the computed value 
  #    of 'p1' and the given value of 'p2', for the normal approximation to work 
  #    well for the following element indices:
  #         2 3 

  #----------

  # Look at how the minimal detectable difference for the two-sample proportion 
  # test decreases with increasing values of Type I error:

  mdd <- propTestMdd(n.or.n1 = 100, n2 = 120, p0.or.p2 = 0.4, sample.type = "two", 
     alpha = c(0.01, 0.05, 0.1, 0.2)) 

  round(mdd, 2) 
  #[1] 0.29 0.25 0.23 0.20

  #----------

  # Clean up
  #---------
  rm(mdd, mdd.list) 

  #==========

  # Modifying the example on pages 8-5 to 8-7 of USEPA (1989b), determine the 
  # minimal detectable difference to detect a difference in the proportion of 
  # detects of cadmium between the background and compliance wells.  Set the 
  # compliance well to "group 1" and the background well to "group 2".  Assume 
  # the true probability of a "detect" at the background well is 1/3, use a 
  # 5% significance level, use 80%, 90%, and 95% power, use the given sample 
  # sizes of 64 observations at the compliance well and 24 observations at the 
  # background well, and use the upper one-sided alternative (probability of a 
  # "detect" at the compliance well is greater than the probability of a "detect" 
  # at the background well). 
  # (The data are stored in EPA.89b.cadmium.df.)  
  #
  # Note that the minimal detectable difference increases from 0.32 to 0.37 to 0.40 as 
  # the required power increases from 80% to 90% to 95%.  Thus, in order to detect a 
  # difference in probability of detection between the compliance and background 
  # wells, the probability of detection at the compliance well must be 0.65, 0.70, 
  # or 0.74 (depending on the required power).

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

  mdd <- propTestMdd(n.or.n1 = n.comp, n2 = n.back, 
    p0.or.p2 = p.hat.back, power = c(.80, .90, .95), 
    sample.type = "two", alternative = "greater") 

  round(mdd, 2) 
  #[1] 0.32 0.37 0.40 

  round(mdd + p.hat.back, 2) 
  #[1] 0.65 0.70 0.73

  #----------

  # Clean up
  #---------
  rm(p.hat.back, p.hat.comp, n.back, n.comp, mdd)



