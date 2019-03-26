library(hydroGOF)


### Name: rPearson
### Title: Mean Squared Error
### Aliases: rPearson rPearson.default rPearson.matrix rPearson.data.frame
###   rPearson.zoo
### Keywords: math

### ** Examples

obs <- 1:10
sim <- 1:10
rPearson(sim, obs)

obs <- 1:10
sim <- 2:11
rPearson(sim, obs)

##################
# Loading daily streamflows of the Ega River (Spain), from 1961 to 1970
data(EgaEnEstellaQts)
obs <- EgaEnEstellaQts

# Generating a simulated daily time series, initially equal to the observed series
sim <- obs 

# Computing the linear correlation for the "best" case
rPearson(sim=sim, obs=obs)

# Randomly changing the first 2000 elements of 'sim', by using a normal distribution 
# with mean 10 and standard deviation equal to 1 (default of 'rnorm').
sim[1:2000] <- obs[1:2000] + rnorm(2000, mean=10)

# Computing the new correlation value
rPearson(sim=sim, obs=obs)



