library(EnvStats)


### Name: chenTTest
### Title: Chen's Modified One-Sided t-test for Skewed Distributions
### Aliases: chenTTest
### Keywords: htest models

### ** Examples

  # The guidance document "Calculating Upper Confidence Limits for 
  # Exposure Point Concentrations at Hazardous Waste Sites" 
  # (USEPA, 2002d, Exhibit 9, p. 16) contains an example of 60 observations 
  # from an exposure unit.  Here we will use Chen's modified t-test to test 
  # the null hypothesis that the average concentration is less than 30 mg/L 
  # versus the alternative that it is greater than 30 mg/L.
  # In EnvStats these data are stored in the vector EPA.02d.Ex.9.mg.per.L.vec.

  sort(EPA.02d.Ex.9.mg.per.L.vec)
  # [1]  16  17  17  17  18  18  20  20  20  21  21  21  21  21  21  22
  #[17]  22  22  23  23  23  23  24  24  24  25  25  25  25  25  25  26
  #[33]  26  26  26  27  27  28  28  28  28  29  29  30  30  31  32  32
  #[49]  32  33  33  35  35  97  98 105 107 111 117 119

  dev.new()
  hist(EPA.02d.Ex.9.mg.per.L.vec, col = "cyan", xlab = "Concentration (mg/L)")

  # The Shapiro-Wilk goodness-of-fit test rejects the null hypothesis of a 
  # normal, lognormal, and gamma distribution:

  gofTest(EPA.02d.Ex.9.mg.per.L.vec)$p.value
  #[1] 2.496781e-12

  gofTest(EPA.02d.Ex.9.mg.per.L.vec, dist = "lnorm")$p.value
  #[1] 3.349035e-09

  gofTest(EPA.02d.Ex.9.mg.per.L.vec, dist = "gamma")$p.value
  #[1] 1.564341e-10


  # Use Chen's modified t-test to test the null hypothesis that
  # the average concentration is less than 30 mg/L versus the 
  # alternative that it is greater than 30 mg/L.

  chenTTest(EPA.02d.Ex.9.mg.per.L.vec, mu = 30)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 mean = 30
  #
  #Alternative Hypothesis:          True mean is greater than 30
  #
  #Test Name:                       One-sample t-Test
  #                                 Modified for
  #                                 Positively-Skewed Distributions
  #                                 (Chen, 1995)
  #
  #Estimated Parameter(s):          mean = 34.566667
  #                                 sd   = 27.330598
  #                                 skew =  2.365778
  #
  #Data:                            EPA.02d.Ex.9.mg.per.L.vec
  #
  #Sample Size:                     60
  #
  #Test Statistic:                  t = 1.574075
  #
  #Test Statistic Parameter:        df = 59
  #
  #P-values:                        z               = 0.05773508
  #                                 t               = 0.06040889
  #                                 Avg. of z and t = 0.05907199
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Based on z
  #
  #Confidence Interval Type:        Lower
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 29.82
  #                                 UCL =   Inf

  # The estimated mean, standard deviation, and skew are 35, 27, and 2.4, 
  # respectively.  The p-value is 0.06, and the lower 95% confidence interval 
  # is [29.8, Inf).  Depending on what you use for your Type I error rate, you 
  # may or may not want to reject the null hypothesis.



