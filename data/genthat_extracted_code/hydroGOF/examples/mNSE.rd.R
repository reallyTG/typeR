library(hydroGOF)


### Name: mNSE
### Title: Modified Nash-Sutcliffe efficiency
### Aliases: mNSeff mNSE mNSE.default mNSE.matrix mNSE.data.frame mNSE.zoo
### Keywords: math

### ** Examples

sim <- 1:10
obs <- 1:10
mNSE(sim, obs)

sim <- 2:11
obs <- 1:10
mNSE(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the 'mNSE' for the "best" (unattainable) case
mNSE(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new 'mNSE'
mNSE(sim=sim, obs=obs)



