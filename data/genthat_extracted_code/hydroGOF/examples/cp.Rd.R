library(hydroGOF)


### Name: cp
### Title: Coefficient of persistence
### Aliases: cp cp.default cp.matrix cp.data.frame cp.zoo
### Keywords: math

### ** Examples

obs <- 1:10
sim <- 1:10
cp(sim, obs)

obs       <- 1:10
sim[2:10] <- obs[1:9]
cp(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing 'cp' for the "best" (unattainable) case
cp(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new  'cp'
cp(sim=sim, obs=obs)



