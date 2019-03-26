library(EnvStats)


### Name: predIntGamma
### Title: Prediction Interval for Gamma Distribution
### Aliases: predIntGamma predIntGammaAlt
### Keywords: distribution htest

### ** Examples

  # Generate 20 observations from a gamma distribution with parameters 
  # shape=3 and scale=2, then create a prediciton interval for the 
  # next observation. 
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 
  dat <- rgamma(20, shape = 3, scale = 2) 
  predIntGamma(dat)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 2.203862
  #                                 scale = 2.174928
  #
  #Estimation Method:               mle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      exact using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on mle of 'shape'
  #
  #Normal Transform Power:          0.246
  #
  #Prediction Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL =  0.5371569
  #                                 UPL = 15.5313783

  #--------------------------------------------------------------------

  # Using the same data as in the previous example, create an upper 
  # one-sided prediction interval for the next three averages of 
  # order 2 (i.e., each mean is based on 2 future observations), and 
  # use the bias-corrected estimate of shape.

  pred.list <- predIntGamma(dat, n.transmean = 2, k = 3, 
    pi.type = "upper", est.method = "bcmle")

  pred.list

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 1.906616
  #                                 scale = 2.514005
  #
  #Estimation Method:               bcmle
  #
  #Data:                            dat
  #
  #Sample Size:                     20
  #
  #Prediction Interval Method:      Bonferroni using
  #                                 Kulkarni & Powar (2010)
  #                                 transformation to Normality
  #                                 based on bcmle of 'shape'
  #
  #Normal Transform Power:          0.246
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Number of Future
  #Transformed Means:               3
  #
  #Sample Size for
  #Transformed Means:               2
  #
  #Prediction Interval:             LPL =  0.00000
  #                                 UPL = 12.17404

  #--------------------------------------------------------------------

  # Continuing with the above example, assume the distribution shifts 
  # in the future to a gamma distribution with shape = 5 and scale = 2.
  # Create 6 future observations from this distribution, and create 3 
  # means by pairing the observations sequentially.  Note we must first 
  # transform these observations using the power 0.246, then compute the 
  # means based on the transformed data, and then transform the means 
  # back to the original scale and compare them to the upper prediction 
  # limit of 12.17

  set.seed(427)
  new.dat <- rgamma(6, shape = 5, scale = 2)

  p <- pred.list$interval$normal.transform.power
  p
  #[1] 0.246
 
  new.dat.trans <- new.dat^p
  means.trans <- c(mean(new.dat.trans[1:2]), mean(new.dat.trans[3:4]), 
    mean(new.dat.trans[5:6]))
  means <- means.trans^(1/p)
  means
  #[1] 11.74214 17.05299 11.65272

  any(means > pred.list$interval$limits["UPL"])
  #[1] TRUE

  #----------

  # Clean up
  rm(dat, pred.list, new.dat, p, new.dat.trans, means.trans, means)

  #--------------------------------------------------------------------

  # Reproduce part of the example on page 73 of 
  # Krishnamoorthy et al. (2008), which uses alkalinity concentrations 
  # reported in Gibbons (1994) and Gibbons et al. (2009) to construct a 
  # one-sided upper 90% prediction limit.

  predIntGamma(Gibbons.et.al.09.Alkilinity.vec, pi.type = "upper", 
    conf.level = 0.9, normal.approx.transform = "cube.root")

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Gamma
  #
  #Estimated Parameter(s):          shape = 9.375013
  #                                 scale = 6.202461
  #
  #Estimation Method:               mle
  #
  #Data:                            Gibbons.et.al.09.Alkilinity.vec
  #
  #Sample Size:                     27
  #
  #Prediction Interval Method:      exact using
  #                                 Wilson & Hilferty (1931) cube-root
  #                                 transformation to Normality
  #
  #Normal Transform Power:          0.3333333
  #
  #Prediction Interval Type:        upper
  #
  #Confidence Level:                90%
  #
  #Number of Future Observations:   1
  #
  #Prediction Interval:             LPL =  0.0000
  #                                 UPL = 85.3495



