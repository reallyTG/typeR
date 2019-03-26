library(ESGtoolkit)


### Name: esgplotts
### Title: Plot time series objects
### Aliases: esgplotts

### ** Examples

kappa <- 1.5
V0 <- theta <- 0.04
sigma <- 0.2
theta1 <- kappa*theta
theta2 <- kappa
theta3 <- sigma
x <- simdiff(n = 10, horizon = 5, frequency = "quart",
model = "OU",
x0 = V0, theta1 = theta1, theta2 = theta2, theta3 = theta3)

esgplotts(x)



