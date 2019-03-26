library(hydroGOF)


### Name: rNSE
### Title: Relative Nash-Sutcliffe efficiency
### Aliases: rNSeff rNSE rNSE.default rNSE.matrix rNSE.data.frame rNSE.zoo
### Keywords: math

### ** Examples

sim <- 1:10
obs <- 1:10
rNSE(sim, obs)

sim <- 2:11
obs <- 1:10
rNSE(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the 'rNSE' for the "best" (unattainable) case
rNSE(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new 'rNSE'
rNSE(sim=sim, obs=obs)



