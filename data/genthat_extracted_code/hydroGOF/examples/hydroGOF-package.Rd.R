library(hydroGOF)


### Name: hydroGOF-package
### Title: Goodness-of-fit (GoF) functions for numerical and graphical
###   comparison of simulated and observed time series, mainly focused on
###   hydrological modelling.
### Aliases: hydroGOF-package hydroGOF
### Keywords: package

### ** Examples

obs <- 1:100
sim <- obs

# Numerical goodness of fit
gof(sim,obs)

# Reverting the order of simulated values
sim <- 100:1
gof(sim,obs)

## Not run: 
##D ggof(sim, obs)
## End(Not run)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
require(zoo)
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to observations
sim <- obs 

# Getting the numeric goodness-of-fit measures for the "best" (unattainable) case
gof(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal 
# distribution  with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Getting the new numeric goodness of fit
gof(sim=sim, obs=obs)

# Graphical representation of 'obs' vs 'sim', along with the numeric 
# goodness-of-fit measures
## Not run: 
##D ggof(sim=sim, obs=obs)
## End(Not run)



