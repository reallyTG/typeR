library(EnvStats)


### Name: EnvStats-package
### Title: Package for Environmental Statistics, Including US EPA Guidance
### Aliases: EnvStats-package EnvStats
### Keywords: package

### ** Examples

  # Look at plots and summary statistics for the TcCB data given in 
  # USEPA (1994b), (the data are stored in EPA.94b.tccb.df). 
  # Arbitrarily set the one censored observation to the censoring level. 
  # Group by the variable Area.

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


  # First plot the data
  #--------------------
  dev.new()
  stripChart(TcCB ~ Area, data = EPA.94b.tccb.df, 
    xlab = "Area", ylab = "TcCB (ppb)")
  mtext("TcCB Concentrations by Area", line = 3, cex = 1.25, font = 2)

  dev.new()
  stripChart(log10(TcCB) ~ Area, data = EPA.94b.tccb.df, 
    p.value = TRUE, 
    xlab = "Area", ylab = expression(paste(log[10], " [ TcCB (ppb) ]")))
  mtext(expression(paste(log[10], "(TcCB) Concentrations by Area")), 
    line = 3, cex = 1.25, font = 2)

  #--------------------------------------------------------------------

  # Now compute summary statistics
  #-------------------------------
  
  sum(EPA.94b.tccb.df$Censored) 
  #[1] 1 

  with(EPA.94b.tccb.df, TcCB[Censored])
  #0.09 

  # Summary statistics will treat the one censored value 
  # as assuming the detection limit.

  summaryFull(TcCB ~ Area, data = EPA.94b.tccb.df)
  #                             Cleanup  Reference
  #N                             77       47      
  #Mean                           3.915    0.5985 
  #Median                         0.43     0.54   
  #10% Trimmed Mean               0.6846   0.5728 
  #Geometric Mean                 0.5784   0.5382 
  #Skew                           7.717    0.9019 
  #Kurtosis                      62.67     0.132  
  #Min                            0.09     0.22   
  #Max                          168.6      1.33   
  #Range                        168.5      1.11   
  #1st Quartile                   0.23     0.39   
  #3rd Quartile                   1.1      0.75   
  #Standard Deviation            20.02     0.2836 
  #Geometric Standard Deviation   3.898    1.597  
  #Interquartile Range            0.87     0.36   
  #Median Absolute Deviation      0.3558   0.2669 
  #Coefficient of Variation       5.112    0.4739

  summaryStats(TcCB ~ Area, data = EPA.94b.tccb.df, digits = 1)
  #           N Mean   SD Median Min   Max
  #Cleanup   77  3.9 20.0    0.4 0.1 168.6
  #Reference 47  0.6  0.3    0.5 0.2   1.3

  #----------------------------------------------------------------

  # Compute Shapiro-Wilk Goodness-of-Fit statistic for the 
  # Reference Area TcCB data assuming a lognormal distribution
  #-----------------------------------------------------------
  
  sw.list <- gofTest(TcCB ~ 1, data = EPA.94b.tccb.df, 
    subset = Area == "Reference", dist = "lnorm")
  sw.list

  # Results of Goodness-of-Fit Test
  # -------------------------------
  #
  # Test Method:                     Shapiro-Wilk GOF
  #
  # Hypothesized Distribution:       Lognormal
  #
  # Estimated Parameter(s):          meanlog = -0.6195712
  #                                  sdlog   =  0.4679530
  #
  # Estimation Method:               mvue
  #
  # Data:                            TcCB
  #
  # Subset With:                     Area == "Reference"
  #
  # Data Source:                     EPA.94b.tccb.df
  #
  # Sample Size:                     47
  #
  # Test Statistic:                  W = 0.978638
  #
  # Test Statistic Parameter:        n = 47
  #
  # P-value:                         0.5371935
  #
  # Alternative Hypothesis:          True cdf does not equal the
  #                                  Lognormal Distribution.

  #----------

  # Plot results of GOF test
  dev.new()
  plot(sw.list)

  #----------------------------------------------------------------

  # Based on the Reference Area data, estimate 90th percentile 
  # and compute a 95% confidence limit for the 90th percentile 
  # assuming a lognormal distribution.
  #------------------------------------------------------------

  with(EPA.94b.tccb.df, 
    eqlnorm(TcCB[Area == "Reference"], p = 0.9, ci = TRUE))

  # Results of Distribution Parameter Estimation
  # --------------------------------------------
  #
  # Assumed Distribution:            Lognormal
  #
  # Estimated Parameter(s):          meanlog = -0.6195712
  #                                  sdlog   =  0.4679530
  #
  # Estimation Method:               mvue
  #
  # Estimated Quantile(s):           90'th %ile = 0.9803307
  #
  # Quantile Estimation Method:      qmle
  #
  # Data:                            TcCB[Area == "Reference"]
  #
  # Sample Size:                     47
  #
  # Confidence Interval for:         90'th %ile
  #
  # Confidence Interval Method:      Exact
  #
  # Confidence Interval Type:        two-sided
  #
  # Confidence Level:                95%
  #
  # Confidence Interval:             LCL = 0.8358791
                                     UCL = 1.2154977
  #----------

  # Cleanup
  rm(TcCB.ref, sw.list)



