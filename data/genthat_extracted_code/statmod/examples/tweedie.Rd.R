library(statmod)


### Name: tweedie
### Title: Tweedie Generalized Linear Models
### Aliases: tweedie
### Keywords: regression

### ** Examples

y <- rgamma(20,shape=5)
x <- 1:20
# Fit a poisson generalized linear model with identity link
glm(y~x,family=tweedie(var.power=1,link.power=1))

# Fit an inverse-Gaussion glm with log-link
glm(y~x,family=tweedie(var.power=3,link.power=0)) 



