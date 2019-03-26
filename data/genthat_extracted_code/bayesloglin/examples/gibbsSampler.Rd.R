library(bayesloglin)


### Name: gibbsSampler
### Title: A blocked Gibbs sampler.
### Aliases: gibbsSampler
### Keywords: htest models

### ** Examples

data(czech)
formula <- freq ~ a*c + b*c + a*d + a*e + c*e + d*e + f
#s <- gibbsSampler (formula, alpha = 1, data = czech, 
#                   nSamples =  15000, verbose = TRUE)
#postMean <- colSums(s[5000:15000,]) / 10000
#postCov <- cov(s[5000:15000,])
#postVar <- diag(postCov)



