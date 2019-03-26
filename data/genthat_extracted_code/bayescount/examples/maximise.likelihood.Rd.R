library(bayescount)


### Name: maximise.likelihood
### Title: Calculate the Maximum Likelihood Parameters of a Continuous or
###   Count Distribution
### Aliases: maximise.likelihood
### Keywords: models

### ** Examples


# obtain values for mean and zero-inflation of a zero-inflated 
# gamma Poisson model:

data <- rpois(100, rgamma(100, shape=1, scale=8))
data[1:15] <- 0

maximise.likelihood(data, "ZIGP")




