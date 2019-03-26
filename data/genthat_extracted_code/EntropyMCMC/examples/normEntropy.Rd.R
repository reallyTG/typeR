library(EntropyMCMC)


### Name: normEntropy
### Title: Theoretical value of the entropy for the multivariate gaussian
### Aliases: normEntropy
### Keywords: file

### ** Examples

d=2 # model dimension
mu=rep(0,d); v = diag(d) # mean and variance
target_param = list(mean=mu, v=v) # parameters
normEntropy(target_param) # the entropy



