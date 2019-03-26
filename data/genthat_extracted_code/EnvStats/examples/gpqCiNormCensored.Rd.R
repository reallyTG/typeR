library(EnvStats)


### Name: gpqCiNormCensored
### Title: Generalized Pivotal Quantity for Confidence Interval for the
###   Mean of a Normal Distribution Based on Censored Data
### Aliases: gpqCiNormCensored gpqCiNormSinglyCensored
###   gpqCiNormMultiplyCensored
### Keywords: distribution htest

### ** Examples

  # Reproduce the entries for n=10 observations with n.cen=6 in Table 4 
  # of Schmee et al. (1985, p.122).
  #
  # Notes: 
  # 1. This table applies to right-censored data, and the 
  #    quantity "r" in this table refers to the number of 
  #    uncensored observations.
  #
  # 2. Passing a value for the argument "seed" simply allows 
  #    you to reproduce this example.  

  # NOTE:  Here to save computing time for the sake of example, we will specify 
  #        just 100 Monte Carlos, whereas Krishnamoorthy and Mathew (2009) 
  #        suggest *10,000* Monte Carlos.

  # Here are the values given in Schmee et al. (1985):
  Schmee.values <- c(-3.59, -2.60, -1.73, -0.24, 0.43, 0.58, 0.73)
  probs <- c(0.025, 0.05, 0.1, 0.5, 0.9, 0.95, 0.975)
  names(Schmee.values) <- paste(probs * 100, "%", sep = "")

  Schmee.values
  # 2.5%    5%   10%   50%   90%   95% 97.5% 
  #-3.59 -2.60 -1.73 -0.24  0.43  0.58  0.73

  gpqs <- gpqCiNormSinglyCensored(n = 10, n.cen = 6, probs = probs, 
    nmc = 100, censoring.side = "right", seed = 529)

  round(gpqs, 2)
  # 2.5%    5%   10%   50%   90%   95% 97.5% 
  #-2.46 -2.03 -1.38 -0.14  0.54  0.65  0.84 

  # This is what you get if you specify nmc = 1000 with the 
  # same value for seed:
  #-----------------------------------------------
  # 2.5%    5%   10%   50%   90%   95% 97.5% 
  #-3.50 -2.49 -1.67 -0.25  0.41  0.57  0.71


  # Clean up
  #---------
  rm(Schmee.values, probs, gpqs)

  #==========

  # Example of using gpqCiNormMultiplyCensored
  #-------------------------------------------

  # Consider the following set of multiply left-censored data:
  dat <- 12:16
  censored <- c(TRUE, FALSE, TRUE, FALSE, FALSE)

  # Since the data are "ordered" we can identify the indices of the 
  # censored observations in the ordered data as follow:

  cen.index <- (1:length(dat))[censored]
  cen.index
  #[1] 1 3

  # Now we can generate a GPQ using gpqCiNormMultiplyCensored.
  # Here we'll generate a GPQs to use to create a  
  # 95% confidence interval for left-censored data.

  # NOTE:  Here to save computing time for the sake of example, we will specify 
  #        just 100 Monte Carlos, whereas Krishnamoorthy and Mathew (2009) 
  #        suggest *10,000* Monte Carlos.

  gpqCiNormMultiplyCensored(n = 5, cen.index = cen.index,  
    probs = c(0.025, 0.975), nmc = 100, seed = 237)
  #     2.5%     97.5% 
  #-1.315592  1.848513 

  #----------

  # Clean up
  #---------
  rm(dat, censored, cen.index)



