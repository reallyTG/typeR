library(Bolstad)


### Name: nvaricp
### Title: Bayesian inference for a normal standard deviation with a scaled
###   inverse chi-squared distribution
### Aliases: nvaricp
### Keywords: misc

### ** Examples


## Suppose we have five observations from a normal(mu, sigma^2)
## distribution mu = 200 which are 206.4, 197.4, 212.7, 208.5.
y = c(206.4, 197.4, 212.7, 208.5, 203.4)

## We wish to choose a prior that has a median of 8. This happens when
## S0 = 29.11 and kappa = 1
nvaricp(y,200,29.11,1)

##  Same as the previous example but a calculate a 95% credible
## interval for sigma. NOTE this method has changed
results = nvaricp(y,200,29.11,1)
quantile(results, probs = c(0.025, 0.975))



