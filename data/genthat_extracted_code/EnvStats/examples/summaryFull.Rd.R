library(EnvStats)


### Name: summaryFull
### Title: Full Complement of Summary Statistics
### Aliases: summaryFull summaryFull.formula summaryFull.default
###   summaryFull.factor summaryFull.data.frame summaryFull.matrix
###   summaryFull.list
### Keywords: univar

### ** Examples

  # Generate 20 observations from a lognormal distribution with 
  # parameters mean=10 and cv=1, and compute the summary statistics.  
  # (Note: the call to set.seed simply allows you to reproduce this 
  # example.)

  set.seed(250) 

  dat <- rlnormAlt(20, mean=10, cv=1) 

  summary(dat) 
  # Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  #2.608   4.995   6.235   7.490   9.295  15.440

  summaryFull(dat) 
  #                             dat     
  #N                            20      
  #Mean                          7.49   
  #Median                        6.235  
  #10% Trimmed Mean              7.125  
  #Geometric Mean                6.674  
  #Skew                          0.9877 
  #Kurtosis                     -0.03539
  #Min                           2.608  
  #Max                          15.44   
  #Range                        12.83   
  #1st Quartile                  4.995  
  #3rd Quartile                  9.295  
  #Standard Deviation            3.803  
  #Geometric Standard Deviation  1.634  
  #Interquartile Range           4.3    
  #Median Absolute Deviation     2.607  
  #Coefficient of Variation      0.5078 

  #----------

  # Compare summary statistics for normal and lognormal data:
  log.dat <- log(dat) 

  summaryFull(list(dat = dat, log.dat = log.dat))
  #                             dat      log.dat
  #N                            20       20     
  #Mean                          7.49     1.898 
  #Median                        6.235    1.83  
  #10% Trimmed Mean              7.125    1.902 
  #Geometric Mean                6.674    1.835 
  #Skew                          0.9877   0.1319
  #Kurtosis                     -0.03539 -0.4288
  #Min                           2.608    0.9587
  #Max                          15.44     2.737 
  #Range                        12.83     1.778 
  #1st Quartile                  4.995    1.607 
  #3rd Quartile                  9.295    2.227 
  #Standard Deviation            3.803    0.4913
  #Geometric Standard Deviation  1.634    1.315 
  #Interquartile Range           4.3      0.62  
  #Median Absolute Deviation     2.607    0.4915
  #Coefficient of Variation      0.5078   0.2588

  # Clean up
  rm(dat, log.dat)

  #--------------------------------------------------------------------

  # Compute summary statistics for 10 observations from a normal 
  # distribution with parameters mean=0 and sd=1.  Note that the 
  # geometric mean and geometric standard deviation are not computed 
  # since some of the observations are non-positive.

  set.seed(287) 

  dat <- rnorm(10) 

  summaryFull(dat) 
  #                          dat     
  #N                         10      
  #Mean                       0.07406
  #Median                     0.1095 
  #10% Trimmed Mean           0.1051 
  #Skew                      -0.1646 
  #Kurtosis                  -0.7135 
  #Min                       -1.549  
  #Max                        1.449  
  #Range                      2.998  
  #1st Quartile              -0.5834 
  #3rd Quartile               0.6966 
  #Standard Deviation         0.9412 
  #Interquartile Range        1.28   
  #Median Absolute Deviation  1.05

  # Clean up
  rm(dat)

  #--------------------------------------------------------------------

  # Compute summary statistics for the TcCB data given in USEPA (1994b) 
  # (the data are stored in EPA.94b.tccb.df).  Arbitrarily set the one 
  # censored observation to the censoring level. Group by the variable 
  # Area.

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



