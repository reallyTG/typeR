library(EnvStats)


### Name: tTestLnormAltPower
### Title: Power of a One- or Two-Sample t-Test Assuming Lognormal Data
### Aliases: tTestLnormAltPower
### Keywords: distribution design htest

### ** Examples

  # Look at how the power of the one-sample test increases with increasing 
  # sample size:

  seq(5, 30, by = 5) 
  #[1]  5 10 15 20 25 30 

  power <- tTestLnormAltPower(n.or.n1 = seq(5, 30, by = 5), 
    ratio.of.means = 1.5, cv = 1) 

  round(power, 2) 
  #[1] 0.14 0.28 0.42 0.54 0.65 0.73

  #----------

  # Repeat the last example, but use the approximation to the power instead of the 
  # exact power.  Note how the approximation underestimates the true power for 
  # the smaller sample sizes:

  power <- tTestLnormAltPower(n.or.n1 = seq(5, 30, by = 5), 
    ratio.of.means = 1.5, cv = 1, approx = TRUE) 

  round(power, 2) 
  #[1] 0.09 0.25 0.40 0.53 0.64 0.73

  #==========

  # Look at how the power of the two-sample t-test increases with increasing 
  # ratio of means:

  power <- tTestLnormAltPower(n.or.n1 = 20, sample.type = "two", 
    ratio.of.means = c(1.1, 1.5, 2), cv = 1) 

  round(power, 2) 
  #[1] 0.06 0.32 0.73

  #----------

  # Look at how the power of the two-sample t-test increases with increasing 
  # values of Type I error:

  power <- tTestLnormAltPower(30, sample.type = "two", ratio.of.means = 1.5, 
    cv = 1, alpha = c(0.001, 0.01, 0.05, 0.1)) 

  round(power, 2) 
  #[1] 0.07 0.23 0.46 0.59

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
  # Assuming a lognormal distribution with a coefficient of variation of 2, 
  # determine the power associated with various sample sizes for this one-sample test. 
  # Based on these calculations, you need to take at least 6 soil samples to 
  # satisfy the requirements for the Type I and Type II errors.

  power <- tTestLnormAltPower(n.or.n1 = 2:8, ratio.of.means = 4, cv = 2, 
    alpha = 0.2, alternative = "greater") 

  names(power) <- paste("N=", 2:8, sep = "")

  round(power, 2) 
  # N=2  N=3  N=4  N=5  N=6  N=7  N=8 
  #0.65 0.80 0.88 0.93 0.96 0.97 0.98

  #----------

  # Repeat the last example, but use the approximate power calculation instead of 
  # the exact one.  Using the approximate power calculation, you need at least 
  # 7 soil samples instead of 6 (because the approximation underestimates the power).

  power <- tTestLnormAltPower(n.or.n1 = 2:8, ratio.of.means = 4, cv = 2, 
    alpha = 0.2, alternative = "greater", approx = TRUE) 

  names(power) <- paste("N=", 2:8, sep = "")

  round(power, 2)
  # N=2  N=3  N=4  N=5  N=6  N=7  N=8 
  #0.55 0.75 0.84 0.90 0.93 0.95 0.97

  #==========

  # Clean up
  #---------
  rm(power)



