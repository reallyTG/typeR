library(wiqid)


### Name: Bayesian Poisson simulation
### Title: Bayesian analysis of count data
### Aliases: Bpoisson

### ** Examples

# Generate a sample from a gamma distribution, maybe the number of ticks
#   observed on a sample of rodents:
n <- 10  # number of trials (rodents examined)
( y <- rpois(n, 1.2) ) # number of ticks on each rodent
Bpoisson(sum(y), n)  # with uniform prior
plot(Bpoisson(sum(y), n))
Bpoisson(sum(y), n, priors=list(mode=1, sd=3))  # with informative prior
plot(Bpoisson(sum(y), n, priors=list(mode=1, sd=3)))



