library(EnvStats)


### Name: propTestN
### Title: Compute Sample Size Necessary to Achieve a Specified Power for a
###   One- or Two-Sample Proportion Test
### Aliases: propTestN
### Keywords: design htest models

### ** Examples

  # Look at how the required sample size of the one-sample 
  # proportion test with a two-sided alternative and Type I error
  # set to 5% increases with increasing power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  propTestN(p.or.p1 = 0.7, p0.or.p2 = 0.5, 
    power = seq(0.5, 0.9, by = 0.1)) 
  #[1] 25 31 38 47 62

  #----------

  # Repeat the last example, but compute the sample size based on 
  # the exact test instead of the approximation.  Note that because
  # we require the actual Type I error (alpha) to be within 
  # 10% of the supplied value of alpha (which is 0.05 by default),
  # due to the discrete nature of the exact binomial test 
  # we end up with more power then we specified.

  n.list <- propTestN(p.or.p1 = 0.7,  p0.or.p2 = 0.5, 
    power = seq(0.5, 0.9, by = 0.1), approx = FALSE) 

  lapply(n.list, round, 3) 
  #$n
  #[1] 37 37 44 51 65
  #
  #$power
  #[1] 0.698 0.698 0.778 0.836 0.910
  #
  #$alpha
  #[1] 0.047 0.047 0.049 0.049 0.046
  #
  #$q.critical.lower
  #[1] 12 12 15 18 24
  #
  #$q.critical.upper
  #[1] 24 24 28 32 40

  #----------

  # Using the example above, see how the sample size changes 
  # if we allow the Type I error to deviate by more than 10 percent 
  # of the value of alpha (i.e., by more than 0.005).  

  n.list <- propTestN(p.or.p1 = 0.7,  p0.or.p2 = 0.5, 
    power = seq(0.5, 0.9, by = 0.1), approx = FALSE, tol.alpha = 0.01) 

  lapply(n.list, round, 3)
  #$n
  #[1] 25 35 42 49 65
  #
  #$power
  #[1] 0.512 0.652 0.743 0.810 0.910
  #
  #$alpha
  #[1] 0.043 0.041 0.044 0.044 0.046
  #
  #$q.critical.lower
  #[1]  7 11 14 17 24
  #
  #$q.critical.upper
  #[1] 17 23 27 31 40

  #----------
  
  # Clean up
  #---------
  rm(n.list)

  #==========

  # Look at how the required sample size for the two-sample 
  # proportion test decreases with increasing difference between 
  # the two population proportions:

  seq(0.4, 0.1, by = -0.1) 
  #[1] 0.4 0.3 0.2 0.1 

  propTestN(p.or.p1 = seq(0.4, 0.1, by = -0.1), 
    p0.or.p2 = 0.5, sample.type = "two") 
  #[1] 661 163 70 36 
  #Warning message:
  #In propTestN(p.or.p1 = seq(0.4, 0.1, by = -0.1), p0.or.p2 = 0.5,  :
  #  The computed sample sizes 'n1' and 'n2' are too small, 
  #  relative to the given values of 'p1' and 'p2', for the normal 
  #  approximation to work well for the following element indices:
  #         4 
   
  #----------

  # Look at how the required sample size for the two-sample 
  # proportion test decreases with increasing values of Type I error:

  propTestN(p.or.p1 = 0.7, p0.or.p2 = 0.5, 
    sample.type = "two", 
    alpha = c(0.001, 0.01, 0.05, 0.1)) 
  #[1] 299 221 163 137

  #==========

  # Modifying the example on pages 8-5 to 8-7 of USEPA (1989b), 
  # determine the required sample size to detect a difference in the 
  # proportion of detects of cadmium between the background and 
  # compliance wells. Set the complicance well to "group 1" and 
  # the backgound well to "group 2".  Assume the true probability 
  # of a "detect" at the background well is 1/3, set the probability 
  # of a "detect" at the compliance well to 0.4 and 0.5, use a 5% 
  # significance level and 95% power, and use the upper 
  # one-sided alternative (probability of a "detect" at the compliance 
  # well is greater than the probability of a "detect" at the background 
  # well).  (The original data are stored in EPA.89b.cadmium.df.) 
  #
  # Note that the required sample size decreases from about 
  # 1160 at each well to about 200 at each well as the difference in 
  # proportions changes from (0.4 - 1/3) to (0.5 - 1/3), but both of 
  # these sample sizes are enormous compared to the number of samples 
  # usually collected in the field.

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

  propTestN(p.or.p1 = c(0.4, 0.50), p0.or.p2 = p.hat.back, 
    alt="greater", sample.type="two") 
  #[1] 1159 199

  #----------

  # Clean up
  #---------
  rm(p.hat.back, p.hat.comp, n.back, n.comp) 



