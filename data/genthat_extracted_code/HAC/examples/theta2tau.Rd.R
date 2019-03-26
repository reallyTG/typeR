library(HAC)


### Name: theta2tau, tau2theta
### Title: Kendall's rank correlation coefficient
### Aliases: theta2tau tau2theta

### ** Examples

# computation of the dependency parameter
x = runif(10)
theta = tau2theta(x, type = 1)

# computation of kendall's tau
y = runif(10, 1, 100)
tau = theta2tau(y, type = 1)



