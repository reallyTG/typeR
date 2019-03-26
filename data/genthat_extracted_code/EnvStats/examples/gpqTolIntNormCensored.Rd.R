library(EnvStats)


### Name: gpqTolIntNormCensored
### Title: Generalized Pivotal Quantity for Tolerance Interval for a Normal
###   Distribution Based on Censored Data
### Aliases: gpqTolIntNormCensored gpqTolIntNormSinglyCensored
###   gpqTolIntNormMultiplyCensored
### Keywords: distribution htest

### ** Examples

  # Reproduce the entries for n=10 observations with n.cen=1 in Table 12.2 
  # of Krishnamoorthy and Mathew (2009, p.331).
  #
  # (Note: passing a value for the argument "seed" simply allows you to 
  # reproduce this example.)  
  #
  # NOTE:  Here to save computing time for the sake of example, we will specify 
  #        just 100 Monte Carlos, whereas Krishnamoorthy and Mathew (2009) 
  #        suggest *10,000* Monte Carlos.

  gpqTolIntNormSinglyCensored(n = 10, n.cen = 1, p = 0.05, probs = 0.05, 
    nmc = 100, seed = 529)
  #       5% 
  #-3.483403


  gpqTolIntNormSinglyCensored(n = 10, n.cen = 1, p = 0.1, probs = 0.05, 
    nmc = 100, seed = 497)
  #      5% 
  #-2.66705


  gpqTolIntNormSinglyCensored(n = 10, n.cen = 1, p = 0.9, probs = 0.95, 
    nmc = 100, seed = 623)
  #     95% 
  #2.478654

  gpqTolIntNormSinglyCensored(n = 10, n.cen = 1, p = 0.95, probs = 0.95, 
    nmc = 100, seed = 623)
  #     95% 
  #3.108452

  #==========

  # Example of using gpqTolIntNormMultiplyCensored
  #-----------------------------------------------

  # Consider the following set of multiply left-censored data:
  dat <- 12:16
  censored <- c(TRUE, FALSE, TRUE, FALSE, FALSE)

  # Since the data are "ordered" we can identify the indices of the 
  # censored observations in the ordered data as follow:

  cen.index <- (1:length(dat))[censored]
  cen.index
  #[1] 1 3

  # Now we can generate a GPQ using gpqTolIntNormMultiplyCensored.
  # Here we'll generate a GPQ corresponding to an upper tolerance 
  # interval with coverage 90% with 95% confidence for 
  # left-censored data.
  # NOTE:  Here to save computing time for the sake of example, we will specify 
  #        just 100 Monte Carlos, whereas Krishnamoorthy and Mathew (2009) 
  #        suggest *10,000* Monte Carlos.

  gpqTolIntNormMultiplyCensored(n = 5, cen.index = cen.index, p = 0.9, 
    probs = 0.95, nmc = 100, seed = 237)
  #     95% 
  #3.952052

  #==========

  # Clean up
  #---------
  rm(dat, censored, cen.index)



