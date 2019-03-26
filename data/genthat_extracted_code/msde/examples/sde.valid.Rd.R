library(msde)


### Name: sde.valid
### Title: SDE data and parameter validators.
### Aliases: sde.valid sde.valid.data sde.valid.params

### ** Examples

# Heston's model
# valid data is: Z > 0
# valid parameters are: gamma, sigma > 0, |rho| < 1, beta > .5 * sigma^2
hmod <- sde.examples("hest") # load model

theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)

# valid data
x0 <- c(X = log(1000), Z = 0.1)
sde.valid.data(model = hmod, x = x0, theta = theta)

# invalid data
x0 <- c(X = log(1000), Z = -0.1)
sde.valid.data(model = hmod, x = x0, theta = theta)

# valid parameters
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
sde.valid.params(model = hmod, theta = theta)

# invalid parameters
theta <- c(alpha = 0.1, gamma = -4, beta = 0.8, sigma = 0.6, rho = -0.8)
sde.valid.params(model = hmod, theta = theta)



