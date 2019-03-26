library(MCMC4Extremes)


### Name: normalp
### Title: Posterior Distribution with Normal Density
### Aliases: normalp

### ** Examples

# Obtaining posterior distribution of a vector of simulated points
x=rnorm(300,2,sqrt(10))

# Obtaning 1000 points of posterior distribution
ajuste=normalp(x, 200)

# Posterior distribution of river Nile dataset
## Not run: data(Nile)
## Not run: postnile=normalp(Nile,1000)



