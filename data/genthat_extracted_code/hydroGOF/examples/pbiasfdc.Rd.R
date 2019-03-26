library(hydroGOF)


### Name: pbiasfdc
### Title: Percent Bias in the Slope of the Midsegment of the Flow Duration
###   Curve
### Aliases: pbiasfdc pbiasfdc.default pbiasfdc.matrix pbiasfdc.data.frame
###   pbiasfdc.zoo
### Keywords: math

### ** Examples

## Not run: 
##D sim <- 1:10
##D obs <- 1:10
##D pbiasfdc(sim, obs)
##D 
##D sim <- 2:11
##D obs <- 1:10
##D pbiasfdc(sim, obs)
##D 
##D ##################
##D # Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
##D data(EgaEnEstellaQts)
##D obs <- EgaEnEstellaQts
##D 
##D # Generating a simulated daily time series, initially equal to the observed series
##D sim <- obs 
##D 
##D # Computing the relative index of agreement for the "best" (unattainable) case
##D pbiasfdc(sim=sim, obs=obs)
##D 
##D # Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
##D # with mean 10 and standard deviation equal to 1 (default of 'rnorm').
##D sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)
##D 
##D # Computing the new relative index of agreement
##D pbiasfdc(sim=sim, obs=obs, col=c("black", "blue"))
## End(Not run)



