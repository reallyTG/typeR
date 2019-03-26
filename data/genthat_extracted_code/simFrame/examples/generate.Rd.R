library(simFrame)


### Name: generate
### Title: Generate data
### Aliases: generate generate-methods generate,character-method
###   generate,DataControl-method generate,missing-method
### Keywords: distribution methods

### ** Examples

require(mvtnorm)
mean <- rep(0, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)

# using a control object
dc <- DataControl(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))
generate(dc)

# supply slots of control object as arguments
generate(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))



