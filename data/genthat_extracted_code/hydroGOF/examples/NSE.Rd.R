library(hydroGOF)


### Name: NSE
### Title: Nash-Sutcliffe Efficiency
### Aliases: NSeff NSE NSE.default NSE.matrix NSE.data.frame NSE.zoo
### Keywords: math

### ** Examples

obs <- 1:10
sim <- 1:10
NSE(sim, obs)

obs <- 1:10
sim <- 2:11
NSE(sim, obs)

#################
# Computing NSE on the (natural) logarithm of simulated and observed values
obs <- 1:10/10
sim <- 2:11/10
NSE(sim=sim, obs=obs, FUN=log)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the 'NSE' for the "best" (unattainable) case
NSE(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new 'NSE'
NSE(sim=sim, obs=obs)



