library(EnvStats)


### Name: elnorm3
### Title: Estimate Parameters of a Three-Parameter Lognormal Distribution
###   (Log-Scale)
### Aliases: elnorm3
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a 3-parameter lognormal distribution 
  # with parameters meanlog=1.5, sdlog=1, and threshold=10, then use 
  # Cohen and Whitten's (1980) modified moments estimators to estimate 
  # the parameters, and construct a confidence interval for the 
  # threshold based on the estimated asymptotic variance. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rlnorm3(20, meanlog = 1.5, sdlog = 1, threshold = 10) 
  elnorm3(dat, method = "mmme", ci = TRUE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            3-Parameter Lognormal
  #
  #Estimated Parameter(s):          meanlog   = 1.5206664
  #                                 sdlog     = 0.5330974
  #                                 threshold = 9.6620403
  #
  #Estimation Method:               mmme
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         threshold
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 Based on Asymptotic Variance
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =  6.985258
  #                                 UCL = 12.338823

  #----------

  # Repeat the above example using the other methods of estimation 
  # and compare. 

  round(elnorm3(dat, "lmle")$parameters, 1) 
  #meanlog     sdlog threshold 
  #    1.3       0.7      10.5 
 
  round(elnorm3(dat, "mme")$parameters, 1) 
  #meanlog     sdlog threshold 
  #    2.1       0.3       6.0 
 
  round(elnorm3(dat, "mmue")$parameters, 1) 
  #meanlog     sdlog threshold 
  #    2.2       0.3       5.8 
  
  round(elnorm3(dat, "mmme")$parameters, 1) 
  #meanlog     sdlog threshold 
  #    1.5       0.5       9.7 
  
  round(elnorm3(dat, "zero.skew")$parameters, 1) 
  #meanlog     sdlog threshold 
  #    1.3       0.6      10.3 
 
  round(elnorm3(dat, "royston")$parameters, 1)
  #meanlog     sdlog threshold 
  #    1.4       0.6      10.1 

  #----------

  # Compare methods for computing a two-sided 95% confidence interval 
  # for the threshold: 
  # modified method of moments estimator using asymptotic variance, 
  # lmle using asymptotic variance, 
  # lmle using likelihood profile, and 
  # zero-skewness estimator using the skewness method.

  elnorm3(dat, method = "mmme", ci = TRUE, 
    ci.method = "avar")$interval$limits 
  #      LCL       UCL 
  # 6.985258 12.338823 
 
  elnorm3(dat, method = "lmle", ci = TRUE, 
    ci.method = "avar")$interval$limits 
  #       LCL       UCL 
  #  9.017223 11.980107 
 
  elnorm3(dat, method = "lmle", ci = TRUE, 
    ci.method="likelihood.profile")$interval$limits 
  #      LCL       UCL 
  # 3.699989 11.266029 
 

  elnorm3(dat, method = "zero.skew", ci = TRUE, 
    ci.method = "skewness")$interval$limits 
  #      LCL       UCL 
  #-25.18851  11.18652

  #----------

  # Now construct a confidence interval for the median of the distribution 
  # based on using the modified method of moments estimator for threshold 
  # and the asymptotic variances and covariances.  Note that the true median 
  # is given by threshold + exp(meanlog) = 10 + exp(1.5) = 14.48169.

  elnorm3(dat, method = "mmme", ci = TRUE, ci.parameter = "median") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            3-Parameter Lognormal
  #
  #Estimated Parameter(s):          meanlog   = 1.5206664
  #                                 sdlog     = 0.5330974
  #                                 threshold = 9.6620403
  #
  #Estimation Method:               mmme
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Confidence Interval for:         median
  #
  #Confidence Interval Method:      Normal Approximation
  #                                 Based on Asymptotic Variance
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 11.20541
  #                                 UCL = 17.26922

  #----------

  # Compare methods for computing a two-sided 95% confidence interval 
  # for the median: 
  # modified method of moments estimator using asymptotic variance, 
  # lmle using asymptotic variance, 
  # lmle using likelihood profile, and 
  # zero-skewness estimator using the skewness method.

  elnorm3(dat, method = "mmme", ci = TRUE, ci.parameter = "median", 
    ci.method = "avar")$interval$limits 
  #     LCL      UCL 
  #11.20541 17.26922 
 
  elnorm3(dat, method = "lmle", ci = TRUE, ci.parameter = "median", 
    ci.method = "avar")$interval$limits 
  #     LCL      UCL 
  #12.28326 15.87233 

  elnorm3(dat, method = "lmle", ci = TRUE, ci.parameter = "median", 
    ci.method = "likelihood.profile")$interval$limits 
  #      LCL       UCL 
  # 6.314583 16.165525 

  elnorm3(dat, method = "zero.skew", ci = TRUE, ci.parameter = "median", 
    ci.method = "skewness")$interval$limits 
  #      LCL       UCL 
  #-22.38322  16.33569

  #----------

  # Clean up
  #---------

  rm(dat)




