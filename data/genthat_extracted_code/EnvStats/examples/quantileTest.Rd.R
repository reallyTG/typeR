library(EnvStats)


### Name: quantileTest
### Title: Two-Sample Rank Test to Detect a Shift in a Proportion of the
###   "Treated" Population
### Aliases: quantileTest
### Keywords: htest models

### ** Examples

  # Following Example 7.5 on pages 7.23-7.24 of USEPA (1994b), perform the 
  # quantile test for the TcCB data (the data are stored in EPA.94b.tccb.df).  
  # There are n=47 observations from the reference area and m=77 observations 
  # from the cleanup unit.  The target rank is set to 9, resulting in a value 
  # of quantile.ub=0.928.  Note that the p-value is 0.0114, not 0.0117.

  EPA.94b.tccb.df
  #    TcCB.orig   TcCB Censored      Area
  #1        0.22   0.22    FALSE Reference
  #2        0.23   0.23    FALSE Reference
  #...
  #46       1.20   1.20    FALSE Reference
  #47       1.33   1.33    FALSE Reference
  #48      <0.09   0.09     TRUE   Cleanup
  #49       0.09   0.09    FALSE   Cleanup
  #...
  #123     51.97  51.97    FALSE   Cleanup
  #124    168.64 168.64    FALSE   Cleanup

  # Determine the values to use for r and k for 
  # a desired significance level of 0.01 
  #--------------------------------------------

  p.vals <- quantileTestPValue(m = 77, n = 47, 
    r = c(rep(8, 3), rep(9, 3), rep(10, 3)), 
    k = c(6, 7, 8, 7, 8, 9, 8, 9, 10)) 

  round(p.vals, 3) 
  #[1] 0.355 0.122 0.019 0.264 0.081 0.011 0.193 0.053 0.007 

  # Choose r=9, k=9 to get a significance level of 0.011
  #-----------------------------------------------------

  with(EPA.94b.tccb.df, 
    quantileTest(TcCB[Area=="Cleanup"], TcCB[Area=="Reference"], 
    target.r = 9)) 

  #Results of Hypothesis Test
  #--------------------------
  #
  #Null Hypothesis:                 e = 0
  #
  #Alternative Hypothesis:          Tail of Fx Shifted to Right of
  #                                 Tail of Fy.
  #                                 0 < e <= 1, where
  #                                 Fx(t) = (1-e)*Fy(t) + e*Fz(t),
  #                                 Fz(t) <= Fy(t) for all t,
  #                                 and Fy != Fz
  #
  #Test Name:                       Quantile Test
  #
  #Data:                            x = TcCB[Area == "Cleanup"]  
  #                                 y = TcCB[Area == "Reference"]
  #
  #Sample Sizes:                    nx = 77
  #                                 ny = 47
  #
  #Test Statistics:                 k (# x obs of r largest) = 9
  #                                 r                        = 9
  #
  #Test Statistic Parameters:       m           = 77.000
  #                                 n           = 47.000
  #                                 quantile.ub =  0.928
  #
  #P-value:                         0.01136926

  #==========

  # Clean up
  #---------

  rm(p.vals)



