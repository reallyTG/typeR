library(rstanarm)


### Name: posterior_survfit
### Title: Estimate subject-specific or standardised survival probabilities
### Aliases: posterior_survfit

### ** Examples

## No test: 
  # Run example model if not already loaded
  if (!exists("example_jm")) example(example_jm)
  
  # Obtain subject-specific survival probabilities for a few
  # selected individuals in the estimation dataset who were  
  # known to survive up until their censoring time. By default
  # the posterior_survfit function will estimate the conditional
  # survival probabilities, that is, conditional on having survived
  # until the event or censoring time, and then by default will
  # extrapolate the survival predictions forward from there.  
  ps1 <- posterior_survfit(example_jm, ids = c(7,13,15))
  # We can plot the estimated survival probabilities using the
  # associated plot function
  plot(ps1)
  
  # If we wanted to estimate the survival probabilities for the
  # same three individuals as the previous example, but this time
  # we won't condition on them having survived up until their 
  # censoring time. Instead, we will estimate their probability
  # of having survived between 0 and 5 years given their covariates
  # and their estimated random effects.
  # The easiest way to achieve the time scale we want (ie, 0 to 5 years)
  # is to specify that we want the survival time estimated at time 0
  # and then extrapolated forward 5 years. We also specify that we
  # do not want to condition on their last known survival time.
  ps2 <- posterior_survfit(example_jm, ids = c(7,13,15), times = 0,
    extrapolate = TRUE, condition = FALSE, control = list(edist = 5))
    
  # Instead we may want to estimate subject-specific survival probabilities 
  # for a set of new individuals. To demonstrate this, we will simply take
  # the first two individuals in the estimation dataset, but pass their data
  # via the newdata arguments so that posterior_survfit will assume we are 
  # predicting survival for new individuals and draw new random effects 
  # under a Monte Carlo scheme (see Rizopoulos (2011)).
  ndL <- pbcLong[pbcLong$id %in% c(1,2),]
  ndE <- pbcSurv[pbcSurv$id %in% c(1,2),]
  ps3 <- posterior_survfit(example_jm,
    newdataLong = ndL, newdataEvent = ndE,
    last_time = "futimeYears", seed = 12345)
  head(ps3)
  # We can then compare the estimated random effects for these 
  # individuals based on the fitted model and the Monte Carlo scheme
  ranef(example_jm)$Long1$id[1:2,,drop=FALSE] # from fitted model
  colMeans(attr(ps3, "b_new"))                # from Monte Carlo scheme
  
  # Lastly, if we wanted to obtain "standardised" survival probabilities, 
  # (by averaging over the observed distribution of the fixed effect 
  # covariates, as well as averaging over the estimated random effects
  # for individuals in our estimation sample or new data) then we can 
  # specify 'standardise = TRUE'. We can then plot the resulting 
  # standardised survival curve.
  ps4 <- posterior_survfit(example_jm, standardise = TRUE, 
                           times = 0, extrapolate = TRUE)
  plot(ps4)
## End(No test)
 



