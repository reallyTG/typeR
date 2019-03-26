library(fitdistrplus)


### Name: prefit
### Title: Pre-fitting procedure
### Aliases: prefit
### Keywords: distribution

### ** Examples


# (1) fit of a gamma distribution by maximum likelihood estimation
#
x <- rgamma(1e3, 5/2, 7/2)

prefit(x, "gamma", "mle", list(shape=3, scale=3), lower=-Inf, upper=Inf)




