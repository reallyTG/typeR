library(EnvStats)


### Name: ehyper
### Title: Estimate Parameter of a Hypergeometric Distribution
### Aliases: ehyper
### Keywords: distribution htest

### ** Examples

  # Generate an observation from a hypergeometric distribution with 
  # parameters m=10, n=30, and k=5, then estimate the parameter m. 
  # Note: the call to set.seed simply allows you to reproduce this example. 
  # Also, the only parameter actually estimated is m; once m is estimated, 
  # n is computed by subtracting the estimated value of m (8 in this example) 
  # from the given of value of m+n (40 in this example).  The parameters 
  # n and k are shown in the output in order to provide information on 
  # all of the parameters associated with the hypergeometric distribution.

  set.seed(250) 
  dat <- rhyper(nn = 1, m = 10, n = 30, k = 5) 
  dat 
  #[1] 1   

  ehyper(dat, total = 40, k = 5) 

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Hypergeometric
  #
  #Estimated Parameter(s):          m =  8
  #                                 n = 32
  #                                 k =  5
  #
  #Estimation Method:               mle for 'm'
  #
  #Data:                            dat
  #
  #Sample Size:                     1

  #----------

  # Use the same data as in the previous example, but estimate m+n instead. 
  # Note: The only parameter estimated is m+n. Once this is estimated, 
  # n is computed by subtracting the given value of m (10 in this case) 
  # from the estimated value of m+n (50 in this example).

  ehyper(dat, m = 10, k = 5)

  #Results of Distribution Parameter Estimation
  #--------------------------------------------
  #
  #Assumed Distribution:            Hypergeometric
  #
  #Estimated Parameter(s):          m = 10
  #                                 n = 40
  #                                 k =  5
  #
  #Estimation Method:               mle for 'm+n'
  #
  #Data:                            dat
  #
  #Sample Size:                     1


  #----------

  # Clean up
  #---------
  rm(dat)



