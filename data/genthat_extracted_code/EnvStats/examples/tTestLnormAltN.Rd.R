library(EnvStats)


### Name: tTestLnormAltN
### Title: Sample Size for a One- or Two-Sample t-Test, Assuming Lognormal
###   Data
### Aliases: tTestLnormAltN
### Keywords: distribution design htest

### ** Examples

  # Look at how the required sample size for the one-sample test increases with 
  # increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  # [1] 0.5 0.6 0.7 0.8 0.9 

  tTestLnormAltN(ratio.of.means = 1.5, power = seq(0.5, 0.9, by = 0.1)) 
  # [1] 19 23 28 36 47

  #----------

  # Repeat the last example, but compute the sample size based on the approximate 
  # power instead of the exact power:

  tTestLnormAltN(ratio.of.means = 1.5, power = seq(0.5, 0.9, by = 0.1), approx = TRUE) 
  # [1] 19 23 29 36 47

  #==========

  # Look at how the required sample size for the two-sample t-test decreases with 
  # increasing ratio of means:

  seq(1.5, 2, by = 0.1) 
  #[1] 1.5 1.6 1.7 1.8 1.9 2.0 

  tTestLnormAltN(ratio.of.means = seq(1.5, 2, by = 0.1), sample.type = "two") 
  #[1] 111  83  65  54  45  39

  #----------

  # Look at how the required sample size for the two-sample t-test decreases with 
  # increasing values of Type I error:

  tTestLnormAltN(ratio.of.means = 1.5, alpha = c(0.001, 0.01, 0.05, 0.1), 
    sample.type = "two") 
  #[1] 209 152 111  92

  #----------

  # For the two-sample t-test, compare the total sample size required to detect a 
  # ratio of means of 2 for equal sample sizes versus the case when the sample size 
  # for the second group is constrained to be 30.  Assume a coefficient of variation 
  # of 1, a 5% significance level, and 95% power.  Note that for the case of equal 
  # sample sizes, a total of 78 samples (39+39) are required, whereas when n2 is 
  # constrained to be 30, a total of 84 samples (54 + 30) are required.

  tTestLnormAltN(ratio.of.means = 2, sample.type = "two") 
  #[1] 39 

  tTestLnormAltN(ratio.of.means = 2, n2 = 30) 
  #$n1: 
  #[1] 54 
  #
  #$n2: 
  #[1] 30

  #==========

  # The guidance document Soil Screening Guidance: Technical Background Document 
  # (USEPA, 1996c, Part 4) discusses sampling design and sample size calculations 
  # for studies to determine whether the soil at a potentially contaminated site 
  # needs to be investigated for possible remedial action. Let 'theta' denote the 
  # average concentration of the chemical of concern.  The guidance document 
  # establishes the following goals for the decision rule (USEPA, 1996c, p.87):
  #
  #     Pr[Decide Don't Investigate | theta > 2 * SSL] = 0.05
  #
  #     Pr[Decide to Investigate | theta <= (SSL/2)] = 0.2
  #
  # where SSL denotes the pre-established soil screening level.
  #
  # These goals translate into a Type I error of 0.2 for the null hypothesis
  #
  #     H0: [theta / (SSL/2)] <= 1
  #
  # and a power of 95% for the specific alternative hypothesis
  #
  #     Ha: [theta / (SSL/2)] = 4
  #
  # Assuming a lognormal distribution and the above values for Type I error and 
  # power, determine the required samples sizes associated with various values of 
  # the coefficient of variation for the one-sample test.  Based on these calculations, 
  # you need to take at least 6 soil samples to satisfy the requirements for the 
  # Type I and Type II errors when the coefficient of variation is 2.

  cv <- c(0.5, 1, 2)
  N <- tTestLnormAltN(ratio.of.means = 4, cv = cv, alpha = 0.2, 
    alternative = "greater") 

  names(N) <- paste("CV=", cv, sep = "")
  N
  #CV=0.5   CV=1   CV=2 
  #     2      3      6 

  #----------

  # Repeat the last example, but use the approximate power calculation instead of the 
  # exact. Using the approximate power calculation, you need 7 soil samples when the 
  # coefficient of variation is 2 (because the approximation underestimates the 
  # true power).

  N <- tTestLnormAltN(ratio.of.means = 4, cv = cv, alpha = 0.2, 
    alternative = "greater", approx = TRUE) 

  names(N) <- paste("CV=", cv, sep = "")
  N
  #CV=0.5   CV=1   CV=2 
  #     3      5      7

  #----------

  # Repeat the last example, but use a Type I error of 0.05.

  N <- tTestLnormAltN(ratio.of.means = 4, cv = cv, alternative = "greater", 
    approx = TRUE) 

  names(N) <- paste("CV=", cv, sep = "")
  N
  #CV=0.5   CV=1   CV=2 
  #     4      6     12

  #==========

  # Reproduce the second column of Table 2 in van Belle and Martin (1993, p.167).

  tTestLnormAltN(ratio.of.means = 1.10, cv = seq(0.1, 0.8, by = 0.1), 
    power = 0.8, sample.type = "two.sample", approx = TRUE) 
  #[1]  19  69 150 258 387 533 691 856

  #==========

  # Clean up
  #---------
  rm(cv, N)



