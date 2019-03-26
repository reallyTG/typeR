library(wiqid)


### Name: Bayesian binomial simulation
### Title: Bayesian analysis of binomial data
### Aliases: Bbinom Bbinomial

### ** Examples

# Generate a sample from a binomial distribution, maybe the number of sites
#   where a species was detected:
n <- 10  # number of trials (sites visited)
( y <- rbinom(1, n, 0.75) ) # number of successes (sites where species detected)
Bbinomial(y, n)  # with uniform prior
Bbinomial(y, n, priors=list(mode=0.4, conc=5))  # with informative prior



