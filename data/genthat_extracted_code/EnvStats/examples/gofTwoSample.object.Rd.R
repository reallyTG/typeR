library(EnvStats)


### Name: gofTwoSample.object
### Title: S3 Class "gofTwoSample"
### Aliases: gofTwoSample.object gofTwoSample
### Keywords: classes

### ** Examples

  # Create an object of class "gofTwoSample", then print it out. 

  # Generate 20 observations from a normal distribution with mean=3 and sd=2, and 
  # generate 10 observaions from a normal distribution with mean=2 and sd=2 then 
  # test whether these sets of observations come from the same distribution.
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(300) 
  dat1 <- rnorm(20, mean = 3, sd = 2) 
  dat2 <- rnorm(10, mean = 1, sd = 2) 
  gofTest(x = dat1, y = dat2, test = "ks")

  #Results of Goodness-of-Fit Test
  #-------------------------------
  #
  #Test Method:                     2-Sample K-S GOF
  #
  #Hypothesized Distribution:       Equal
  #
  #Data:                            x = dat1
  #                                 y = dat2
  #
  #Sample Sizes:                    n.x = 20
  #                                 n.y = 10
  #
  #Test Statistic:                  ks = 0.7
  #
  #Test Statistic Parameters:       n = 20
  #                                 m = 10
  #
  #P-value:                         0.001669561
  #
  #Alternative Hypothesis:          The cdf of 'dat1' does not equal
  #                                 the cdf of 'dat2'.

  #----------
  # Clean up

  rm(dat1, dat2)



