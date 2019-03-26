library(hydroGOF)


### Name: ggof
### Title: Graphical Goodness of Fit
### Aliases: ggof
### Keywords: dplot math

### ** Examples

obs <- 1:10
sim <- 2:11

## Not run: 
##D ggof(sim, obs)
## End(Not run)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Getting the numeric goodness of fit for the "best" (unattainable) case
gof(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Getting the new numeric goodness-of-fit measures
gof(sim=sim, obs=obs)

# Getting the graphical representation of 'obs' and 'sim' along with the numeric 
# goodness-of-fit measures for the daily and monthly time series 
## Not run: 
##D ggof(sim=sim, obs=obs, ftype="dm", FUN=mean)
## End(Not run)

# Getting the graphical representation of 'obs' and 'sim' along with some numeric 
# goodness-of-fit measures for the seasonal time series 
## Not run: 
##D ggof(sim=sim, obs=obs, ftype="seasonal", FUN=mean)
## End(Not run)

# Computing the daily residuals 
# even if this is a dummy example, it is enough for illustrating the capability
r <- sim-obs

# Summarizing and plotting the residuals
## Not run: 
##D library(hydroTSM)
##D 
##D # summary
##D smry(r) 
##D 
##D # daily, monthly and annual plots, boxplots and histograms
##D hydroplot(r, FUN=mean)
##D 
##D # seasonal plots and boxplots
##D hydroplot(r, FUN=mean, pfreq="seasonal")
## End(Not run)




