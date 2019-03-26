library(epitrix)


### Name: gamma_shapescale2mucv
### Title: Reparameterise Gamma distributions
### Aliases: gamma_shapescale2mucv gamma_mucv2shapescale
###   gamma_log_likelihood

### ** Examples


## set up some parameters

mu <- 10
cv <- 1


## transform into shape scale

tmp <- gamma_mucv2shapescale (mu, cv)
shape <- tmp$shape
scale <- tmp$scale


## recover original parameters when applying the revert function

gamma_shapescale2mucv(shape, scale) # compare with mu, cv


## empirical validation:
## check mean / cv of a sample derived using rgamma with
## shape and scale computed from mu and cv

gamma_sample <- rgamma(n = 10000, shape = shape, scale = scale)
mean(gamma_sample) # compare to mu
sd(gamma_sample) / mean(gamma_sample) # compare to cv




