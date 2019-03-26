library(SightabilityModel)


### Name: vardiff
### Title: Function to estimate the variance of the difference between two
###   population estimates
### Aliases: vardiff
### Keywords: methods

### ** Examples


# Example using moose survey data 
  data(obs.m) # observational moose survey data
  data(exp.m) # experimental moose survey data
  data(sampinfo.m) # information on sampling rates
 
# Estimate population size in 2006 and 2007 
 sampinfo <- sampinfo.m[sampinfo.m$year == 2007, ]
 tau.2007 <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year == 2007, ], 
                         sdat = exp.m, sampinfo.m[sampinfo.m$year == 2007, ], 
                         method = "Wong", logCI = TRUE, alpha = 0.05, Vm.boot = FALSE) 
 tau.2006 <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year == 2006, ],
                         sdat = exp.m, sampinfo.m[sampinfo.m$year == 2006, ],
                         method = "Wong", logCI = TRUE, alpha = 0.05, Vm.boot = FALSE) 

# naive variance
  tau.2007$est[2]+tau.2006$est[2]

# variance after subtracting positvie covariance
  vardiff(tau.2007, tau.2006)



