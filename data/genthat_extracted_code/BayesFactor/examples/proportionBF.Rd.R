library(BayesFactor)


### Name: proportionBF
### Title: Function for Bayesian analysis of proportions
### Aliases: proportionBF
### Keywords: htest

### ** Examples

bf = proportionBF(y = 15, N = 25, p = .5)
bf
## Sample from the corresponding posterior distribution
samples =proportionBF(y = 15, N = 25, p = .5, posterior = TRUE, iterations = 10000)
plot(samples[,"p"])



