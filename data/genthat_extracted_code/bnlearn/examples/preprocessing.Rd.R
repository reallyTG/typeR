library(bnlearn)


### Name: preprocess
### Title: Pre-process data to better learn Bayesian networks
### Aliases: discretize dedup
### Keywords: data preprocessing

### ** Examples

data(gaussian.test)
d = discretize(gaussian.test, method = 'hartemink', breaks = 4, ibreaks = 20)
plot(hc(d))
d2 = dedup(gaussian.test)



