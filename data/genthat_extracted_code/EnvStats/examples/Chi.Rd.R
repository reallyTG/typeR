library(EnvStats)


### Name: Chi
### Title: The Chi Distribution
### Aliases: Chi dchi pchi qchi rchi
### Keywords: distribution datagen

### ** Examples

  # Density of a chi distribution with 4 degrees of freedom, evaluated at 3:

  dchi(3, 4) 
  #[1] 0.1499715

  #----------

  # The 95'th percentile of a chi distribution with 10 degrees of freedom:

  qchi(.95, 10) 
  #[1] 4.278672

  #----------

  # The cumulative distribution function of a chi distribution with 
  # 5 degrees of freedom evaluated at 3:

  pchi(3, 5) 
  #[1] 0.8909358

  #----------

  # A random sample of 2 numbers from a chi distribution with 7 degrees of freedom. 
  # (Note: the call to set.seed simply allows you to reproduce this example.)

  set.seed(20) 
  rchi(2, 7) 
  #[1] 3.271632 2.035179



