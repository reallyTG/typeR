library(EnvStats)


### Name: elnormAlt
### Title: Estimate Parameters of a Lognormal Distribution (Original Scale)
### Aliases: elnormAlt
### Keywords: distribution htest

### ** Examples

  # Using the Reference area TcCB data in the data frame EPA.94b.tccb.df, 
  # estimate the mean and coefficient of variation, 
  # and construct a 95% confidence interval for the mean.

  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], ci = TRUE))  

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Lognormal
  #
  #Estimated Parameter(s):          mean = 0.5989072
  #                                 cv   = 0.4899539
  #
  #Estimation Method:               mvue
  #
  #Data:                            TcCB[Area == "Reference"]
  #
  #Sample Size:                     47
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Land
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.5243787
  #                                 UCL = 0.7016992

  #----------

  # Compare the different methods of estimating the distribution parameters using the 
  # Reference area TcCB data.

  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], method = "mvue"))$parameters
  #     mean        cv 
  #0.5989072 0.4899539

  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], method = "qmle"))$parameters
  #     mean        cv 
  #0.6004468 0.4947791 
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], method = "mle"))$parameters
  #     mean        cv 
  #0.5990497 0.4888968 
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], method = "mme"))$parameters
  #     mean        cv 
  #0.5985106 0.4688423 
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], method = "mmue"))$parameters
  #     mean        cv 
  #0.5985106 0.4739110

  #----------

  # Compare the different methods of constructing the confidence interval for
  # the mean using the Reference area TcCB data.
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], 
    method = "mvue", ci = TRUE, ci.method = "land"))$interval$limits
  #      LCL       UCL 
  #0.5243787 0.7016992

  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], 
    method = "mvue", ci = TRUE, ci.method = "zou"))$interval$limits
  #      LCL       UCL 
  #0.5230444 0.6962071 

  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], 
    method = "mvue", ci = TRUE, ci.method = "parkin"))$interval$limits
  # LCL  UCL 
  #0.50 0.74 
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], 
     method = "mvue", ci = TRUE, ci.method = "cox"))$interval$limits
  #      LCL       UCL 
  #0.5196213 0.6938444 
 
  with(EPA.94b.tccb.df, elnormAlt(TcCB[Area == "Reference"], 
     method = "mvue", ci = TRUE, ci.method = "normal.approx"))$interval$limits
  #      LCL       UCL 
  #0.5130160 0.6847984 

  #----------

  # Reproduce the example in Highlights 7 and 8 of USEPA (1992d).  This example shows 
  # how to compute the upper 95% confidence limit of the mean of a lognormal distribution 
  # and compares it to the result of computing the upper 95% confidence limit assuming a 
  # normal distribution. The data for this example are chromium concentrations (mg/kg) in 
  # soil samples collected randomly over a Superfund site, and are stored in the data frame 
  # EPA.92d.chromium.vec.

  # First look at the data 

  EPA.92d.chromium.vec
  # [1]   10   13   20   36   41   59   67  110  110  136  140  160  200  230 1300

  stripChart(EPA.92d.chromium.vec, ylab = "Chromium (mg/kg)")

  # Note there is one very large "outlier" (1300).  
  # Perform a goodness-of-fit test to determine whether a lognormal distribution 
  # is appropriate:

  gof.list <- gofTest(EPA.92d.chromium.vec, dist = 'lnormAlt') 
  gof.list 

  #Results of Goodness-of-Fit Test 
  #------------------------------- 
  #
  #Test Method:                     Shapiro-Wilk GOF
  #
  #Hypothesized Distribution:       Lognormal 
  #
  #Estimated Parameter(s):          mean = 159.855185
  #                                 cv   =   1.493994
  #
  #Estimation Method:               mvue
  #
  #Data:                            EPA.92d.chromium.vec
  #
  #Sample Size:                     15
  #
  #Test Statistic:                  W = 0.9607179
  #
  #Test Statistic Parameter:        n = 15
  #
  #P-value:                         0.7048747
  #
  #Alternative Hypothesis:          True cdf does not equal the
  #                                 Lognormal Distribution. 

  plot(gof.list, digits = 2)

  # The lognormal distribution seems to provide an adequate fit, although the largest 
  # observation (1300) is somewhat suspect, and given the small sample size there is 
  # not much power to detect any kind of mild deviation from a lognormal distribution.
  
  # Now compute the one-sided 95% upper confidence limit for the mean.  
  # Note that the value of 502 mg/kg shown in Hightlight 7 of USEPA (1992d) is a bit 
  # larger than the exact value of 496.6 mg/kg shown below.  
  # This is simply due to rounding error.

  elnormAlt(EPA.92d.chromium.vec, ci = TRUE, ci.type = "upper") 

  #Results of Distribution Parameter Estimation 
  #-------------------------------------------- 
  #
  #Assumed Distribution:          Lognormal 
  #
  #Estimated Parameter(s):        mean = 159.855185
  #                                 cv   =   1.493994 
  #
  #Estimation Method:             mvue 
  #
  #Data:                          EPA.92d.chromium.vec 
  #
  #Sample Size:                   15 
  #
  #Confidence Interval for:       mean 
  #
  #Confidence Interval Method:    Land 
  #
  #Confidence Interval Type:      upper 
  #
  #Confidence Level:              95% 
  #
  #Confidence Interval:           LCL =   0 
  #                               UCL = 496.6282 

  # Now compare this result with the upper 95% confidence limit based on assuming 
  # a normal distribution.  Again note that the value of 325 mg/kg shown in 
  # Hightlight 8 is slightly larger than the exact value of 320.3 mg/kg shown below.  
  # This is simply due to rounding error.

  enorm(EPA.92d.chromium.vec, ci = TRUE, ci.type = "upper") 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Normal
  #
  #Estimated Parameter(s):          mean = 175.4667
  #                                 sd   = 318.5440
  #
  #Estimation Method:               mvue
  #
  #Data:                            EPA.92d.chromium.vec
  #
  #Sample Size:                     15
  #
  #Confidence Interval for:         mean
  #
  #Confidence Interval Method:      Exact
  #
  #Confidence Interval Type:        upper
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL =     -Inf
  #                                 UCL = 320.3304

  #----------

  # Clean up
  #---------

  rm(gof.list)



