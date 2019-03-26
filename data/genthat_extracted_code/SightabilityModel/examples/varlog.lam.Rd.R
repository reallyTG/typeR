library(SightabilityModel)


### Name: varlog.lam
### Title: Calculates the variance of the log rate of change between 2
###   population estimates that rely on the same sightability model.
### Aliases: varlog.lam
### Keywords: methods

### ** Examples

# Example using moose survey data 
  data(obs.m) # observational moose survey data
  data(exp.m) # experimental moose survey data
  data(sampinfo.m) # information on sampling rates
 
# Estimate population size in 2006 and 2007 
  sampinfo <- sampinfo.m[sampinfo.m$year==2007, ]
  tau.2007 <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year==2007, ],
                          sdat = exp.m, sampinfo.m[sampinfo.m$year == 2007, ],
                          method = "Wong", logCI = TRUE, alpha = 0.05, Vm.boot = FALSE) 
  tau.2006 <- Sight.Est(observed ~ voc, odat = obs.m[obs.m$year==2006, ],
                          sdat = exp.m, sampinfo.m[sampinfo.m$year == 2006, ], 
                          method = "Wong", logCI = TRUE, alpha = 0.05, Vm.boot = FALSE)  

# Log rate of change 
  varlog.lam(tau.2006, tau.2007)



