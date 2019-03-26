library(EnvStats)


### Name: tTestLnormAltRatioOfMeans
### Title: Minimal or Maximal Detectable Ratio of Means for One- or
###   Two-Sample t-Test, Assuming Lognormal Data
### Aliases: tTestLnormAltRatioOfMeans
### Keywords: distribution design htest

### ** Examples

  # Look at how the minimal detectable ratio of means for the one-sample t-test 
  # increases with increasing required power:

  seq(0.5, 0.9, by = 0.1) 
  #[1] 0.5 0.6 0.7 0.8 0.9 

  ratio.of.means <- tTestLnormAltRatioOfMeans(n.or.n1 = 20, 
    power = seq(0.5, 0.9, by = 0.1)) 

  round(ratio.of.means, 2) 
  #[1] 1.47 1.54 1.63 1.73 1.89

  #----------

  # Repeat the last example, but compute the minimal detectable ratio of means 
  # based on the approximate power instead of the exact:

  ratio.of.means <- tTestLnormAltRatioOfMeans(n.or.n1 = 20, 
    power = seq(0.5, 0.9, by = 0.1), approx = TRUE) 

  round(ratio.of.means, 2) 
  #[1] 1.48 1.55 1.63 1.73 1.89

  #==========

  # Look at how the minimal detectable ratio of means for the two-sample t-test 
  # decreases with increasing sample size:

  seq(10, 50, by = 10) 
  #[1] 10 20 30 40 50 

  ratio.of.means <- tTestLnormAltRatioOfMeans(seq(10, 50, by = 10), sample.type="two") 

  round(ratio.of.means, 2) 
  #[1] 4.14 2.65 2.20 1.97 1.83

  #----------

  # Look at how the minimal detectable ratio of means for the two-sample t-test 
  # decreases with increasing values of Type I error:

  ratio.of.means <- tTestLnormAltRatioOfMeans(n.or.n1 = 20, 
    alpha = c(0.001, 0.01, 0.05, 0.1), sample.type = "two") 

  round(ratio.of.means, 2) 
  #[1] 4.06 3.20 2.65 2.42

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
  # Assuming a lognormal distribution, the above values for Type I and power, and a 
  # coefficient of variation of 2, determine the minimal detectable increase above 
  # the soil screening level associated with various sample sizes for the one-sample 
  # test.  Based on these calculations, you need to take at least 6 soil samples to 
  # satisfy the requirements for the Type I and Type II errors when the coefficient 
  # of variation is 2.

  N <- 2:8
  ratio.of.means <- tTestLnormAltRatioOfMeans(n.or.n1 = N, cv = 2, alpha = 0.2, 
    alternative = "greater") 

  names(ratio.of.means) <- paste("N=", N, sep = "")
  round(ratio.of.means, 1) 
  # N=2  N=3  N=4  N=5  N=6  N=7  N=8 
  #19.9  7.7  5.4  4.4  3.8  3.4  3.1

  #----------

  # Repeat the last example, but use the approximate power calculation instead of 
  # the exact.  Using the approximate power calculation, you need 7 soil samples 
  # when the coefficient of variation is 2.  Note how poorly the approximation 
  # works in this case for small sample sizes!

  ratio.of.means <- tTestLnormAltRatioOfMeans(n.or.n1 = N, cv = 2, alpha = 0.2, 
    alternative = "greater", approx = TRUE) 

  names(ratio.of.means) <- paste("N=", N, sep = "")
  round(ratio.of.means, 1) 
  #  N=2   N=3   N=4   N=5   N=6   N=7   N=8 
  #990.8  18.5   8.3   5.7   4.6   3.9   3.5

  #==========

  # Clean up
  #---------
  rm(ratio.of.means, N)



