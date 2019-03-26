library(EnvStats)


### Name: predIntPois
### Title: Prediction Interval for a Poisson Distribution
### Aliases: predIntPois
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a Poisson distribution with parameter 
  # lambda=2.  The interval [0, 4] contains 94.7% of this distribution and 
  # the interval [0,5] contains 98.3% of this distribution.  Thus, because 
  # of the discrete nature of the Poisson distribution, no interval contains 
  # exactly 95% of this distribution.  Use predIntPois to estimate the mean 
  # parameter of the true distribution, and construct a one-sided upper 
  # 95% prediction interval for the next single observation from this distribution. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(250) 
  dat <- rpois(20, lambda = 2) 

  predIntPois(dat, pi.type = "upper") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 1.8
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      conditional
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL = 0
  #                                 UPL = 5

  #----------

  # Compare results above with the other approximation methods:

  predIntPois(dat, method = "conditional.approx.normal", 
    pi.type = "upper")$interval$limits
  #LPL UPL 
  #  0   4  
 

  predIntPois(dat, method = "conditional.approx.t", 
    pi.type = "upper")$interval$limits 
  #LPL UPL 
  #  0   4 


  predIntPois(dat, method = "normal.approx", 
    pi.type = "upper")$interval$limits 
  #LPL UPL 
  #  0   4 
  #Warning message:
  #In predIntPois(dat, method = "normal.approx", pi.type = "upper") :
  #  Estimated value of 'lambda' and/or number of future observations 
  #  is/are probably too small for the normal approximation to work well.

  #==========

  # Using the same data as in the previous example, compute a one-sided 
  # upper 95% prediction limit for k=10 future observations.  

  # Using conditional approximation method based on the normal distribution.

  predIntPois(dat, k = 10, method = "conditional.approx.normal", 
    pi.type = "upper") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 1.8
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      conditional.approx.normal
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Number of Future Observations:   10
  #
  #Prediction Interval:             LPL = 0
  #                                 UPL = 6

  
  # Using method based on approximating conditional distribution with 
  # Student's t-distribution

  predIntPois(dat, k = 10, method = "conditional.approx.t", 
    pi.type = "upper")$interval$limits
  #LPL UPL 
  #  0   6 

  #==========

  # Repeat the above example, but set k=5 and n.sum=3.  Thus, we want a 
  # 95% upper prediction limit for the next 5 sets of sums of 3 observations.

  predIntPois(dat, k = 5, n.sum = 3, method = "conditional.approx.t", 
    pi.type = "upper")$interval$limits
  #LPL UPL 
  #  0  12

  #==========

  # Reproduce Example 3.6 in Gibbons et al. (2009, p. 75)
  # A 32-constituent VOC scan was performed for n=16 upgradient 
  # samples and there were 5 detections out of these 16.  We 
  # want to construct a one-sided upper 95% prediction limit 
  # for 20 monitoring wells (so k=20 future observations) based 
  # on these data.

  # First we need to create a data set that will yield a mean 
  # of 5/16 based on a sample size of 16.  Any number of data 
  # sets will do.  Here are two possible ones:

  dat <- c(rep(1, 5), rep(0, 11))
  dat <- c(2, rep(1, 3), rep(0, 12))

  # Now call predIntPois.  Don't round the limits so we can 
  # compare to the example in Gibbons et al. (2009).

  predIntPois(dat, k = 20, method = "conditional.approx.t", 
    pi.type = "upper", round.limits = FALSE)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Poisson
  #
  #Estimated Parameter(s):          lambda = 0.3125
  #
  #Estimation Method:               mle/mme/mvue
  #
  #Data:                            dat
  #
  #Sample Size:                     16
  #
  #Prediction Interval Method:      conditional.approx.t
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Number of Future Observations:   20
  #
  #Prediction Interval:             LPL = 0.000000
  #                                 UPL = 2.573258

  #==========

  # Cleanup
  #--------
  rm(dat)



