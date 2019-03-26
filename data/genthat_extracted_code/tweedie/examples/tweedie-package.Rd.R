library(tweedie)


### Name: tweedie-package
### Title: Tweedie Distributions
### Aliases: tweedie-package Tweedie
### Keywords: models

### ** Examples

# Generate random numbers
set.seed(987654)
y <- rtweedie( 20, xi=1.5, mu=1, phi=1)
	# With Tweedie index  xi   between 1 and 2, this produces continuous
	# data with exact zeros
x <- rnorm( length(y), 0, 1)  # Unrelated predictor

# With exact zeros, Tweedie index  xi  must be between 1 and 2

# Fit the tweedie distribution; expect  xi  about 1.5
library(statmod)

xi.vec <- seq(1.1, 1.9, by=0.5)
out <- tweedie.profile( y~1, xi.vec=xi.vec, do.plot=TRUE, verbose=TRUE)

# Fit the glm
require(statmod) # Provides  tweedie  family functions
summary(glm( y ~ x, family=tweedie(var.power=out$xi.max, link.power=0) ))



