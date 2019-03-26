library(Bolstad)


### Name: normmixp
### Title: Bayesian inference on a normal mean with a mixture of normal
###   priors
### Aliases: normmixp
### Keywords: misc

### ** Examples


## generate a sample of 20 observations from a N(-0.5, 1) population
x = rnorm(20, -0.5, 1)

## find the posterior density with a N(0, 1) prior on mu - a 50:50 mix of
## two N(0, 1) densities
normmixp(x, 1, c(0, 1), c(0, 1))

## find the posterior density with 50:50 mix of a N(0.5, 3) prior and a
## N(0, 1) prior on mu
normmixp(x, 1, c(0.5, 3), c(0, 1))

## Find the posterior density for mu, given a random sample of 4
## observations from N(mu, 1), y = [2.99, 5.56, 2.83, 3.47],
## and a 80:20 mix of a N(3, 2) prior and a N(0, 100) prior for mu
x = c(2.99, 5.56, 2.83, 3.47)
normmixp(x, 1, c(3, 2), c(0, 100), 0.8)




