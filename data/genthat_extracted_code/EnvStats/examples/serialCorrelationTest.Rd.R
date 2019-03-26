library(EnvStats)


### Name: serialCorrelationTest
### Title: Test for the Presence of Serial Correlation
### Aliases: serialCorrelationTest serialCorrelationTest.default
###   serialCorrelationTest.lm 'serial correlation test' 'serial
###   correlation'
### Keywords: univar models

### ** Examples

  # Generate a purely random normal process, then use serialCorrelationTest 
  # to test for the presence of correlation. 
  # (Note: the call to set.seed allows you to reproduce this example.) 

  set.seed(345) 
  x <- rnorm(100) 

  # Look at the data
  #-----------------
  dev.new()
  ts.plot(x)

  dev.new()
  acf(x)

  # Test for serial correlation
  #----------------------------
  serialCorrelationTest(x) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 rho = 0
  #
  #Alternative Hypothesis:          True rho is not equal to 0
  #
  #Test Name:                       Rank von Neumann Test for
  #                                 Lag-1 Autocorrelation
  #                                 (Beta Approximation)
  #
  #Estimated Parameter(s):          rho = 0.02773737
  #
  #Estimation Method:               Yule-Walker
  #
  #Data:                            x
  #
  #Sample Size:                     100
  #
  #Test Statistic:                  RVN = 1.929733
  #
  #P-value:                         0.7253405
  #
  #Confidence Interval for:         rho
  #
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = -0.1681836
  #                                 UCL =  0.2236584

  # Clean up
  #---------
  rm(x)
  graphics.off()

  #==========

  # Now use the R function arima.sim to generate an AR(1) process with a 
  # lag-1 autocorrelation of 0.8, then test for autocorrelation.

  set.seed(432) 
  y <- arima.sim(model = list(ar = 0.8), n = 100) 

  # Look at the data
  #-----------------
  dev.new()
  ts.plot(y)

  dev.new()
  acf(y)

  # Test for serial correlation
  #----------------------------
  serialCorrelationTest(y)

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 rho = 0
  #
  #Alternative Hypothesis:          True rho is not equal to 0
  #
  #Test Name:                       Rank von Neumann Test for
  #                                 Lag-1 Autocorrelation
  #                                 (Beta Approximation)
  #
  #Estimated Parameter(s):          rho = 0.835214
  #
  #Estimation Method:               Yule-Walker
  #
  #Data:                            y
  #
  #Sample Size:                     100
  #
  #Test Statistic:                  RVN = 0.3743174
  #
  #P-value:                         0
  #
  #Confidence Interval for:         rho
  #
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.7274307
  #                                 UCL = 0.9429973

  #----------

  # Clean up
  #---------
  rm(y)
  graphics.off()

  #==========

  # The data frame Air.df contains information on ozone (ppb^1/3), 
  # radiation (langleys), temperature (degrees F), and wind speed (mph) 
  # for 153 consecutive days between May 1 and September 30, 1973.  
  # First test for serial correlation in (the cube root of) ozone.  
  # Note that we must use the test based on the MLE because the time series 
  # contains missing values.  Serial correlation appears to be present.  
  # Next fit a linear model that includes the predictor variables temperature, 
  # radiation, and wind speed, and test for the presence of serial correlation 
  # in the residuals.  There is no evidence of serial correlation.

  # Look at the data
  #-----------------

  Air.df
  #              ozone radiation temperature wind
  #05/01/1973 3.448217       190          67  7.4
  #05/02/1973 3.301927       118          72  8.0
  #05/03/1973 2.289428       149          74 12.6
  #05/04/1973 2.620741       313          62 11.5
  #05/05/1973       NA        NA          56 14.3
  #...
  #09/27/1973       NA       145          77 13.2
  #09/28/1973 2.410142       191          75 14.3
  #09/29/1973 2.620741       131          76  8.0
  #09/30/1973 2.714418       223          68 11.5

  #----------

  # Test for serial correlation
  #----------------------------

  with(Air.df, 
    serialCorrelationTest(ozone, test = "AR1.mle"))

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 rho = 0
  #
  #Alternative Hypothesis:          True rho is not equal to 0
  #
  #Test Name:                       z-Test for
  #                                 Lag-1 Autocorrelation
  #                                 (Wald Test Based on MLE)
  #
  #Estimated Parameter(s):          rho = 0.5641616
  #
  #Estimation Method:               Maximum Likelihood
  #
  #Data:                            ozone
  #
  #Sample Size:                     153
  #
  #Number NA/NaN/Inf's:             37
  #
  #Test Statistic:                  z = 7.586952
  #
  #P-value:                         3.28626e-14
  #
  #Confidence Interval for:         rho
  #
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = 0.4184197
  #                                 UCL = 0.7099034

  #----------

  # Next fit a linear model that includes the predictor variables temperature, 
  # radiation, and wind speed, and test for the presence of serial correlation 
  # in the residuals.  Note setting the argument na.action = na.exclude in the 
  # call to lm to correctly deal with missing values.
  #----------------------------------------------------------------------------

  lm.ozone <- lm(ozone ~ radiation + temperature + wind + 
    I(temperature^2) + I(wind^2), 
    data = Air.df, na.action = na.exclude) 


  # Now test for serial correlation in the residuals.
  #--------------------------------------------------

  serialCorrelationTest(lm.ozone, test = "AR1.mle") 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 rho = 0
  #
  #Alternative Hypothesis:          True rho is not equal to 0
  #
  #Test Name:                       z-Test for
  #                                 Lag-1 Autocorrelation
  #                                 (Wald Test Based on MLE)
  #
  #Estimated Parameter(s):          rho = 0.1298024
  #
  #Estimation Method:               Maximum Likelihood
  #
  #Data:                            Residuals
  #
  #Data Source:                     lm.ozone
  #
  #Sample Size:                     153
  #
  #Number NA/NaN/Inf's:             42
  #
  #Test Statistic:                  z = 1.285963
  #
  #P-value:                         0.1984559
  #
  #Confidence Interval for:         rho
  #
  #Confidence Interval Method:      Normal Approximation
  #
  #Confidence Interval Type:        two-sided
  #
  #Confidence Level:                95%
  #
  #Confidence Interval:             LCL = -0.06803223
  #                                 UCL =  0.32763704

  # Clean up
  #---------
  rm(lm.ozone)




