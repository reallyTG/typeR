library(rodd)


### Name: plot.tpopt
### Title: Plot of Psi function for resulting design
### Aliases: plot.tpopt
### Keywords: auxiliary

### ** Examples

#List of models
eta.1 = function(x, theta.1) 
    theta.1[1] + theta.1[2] * x + theta.1[3] * (x ^ 2) + 
    theta.1[4] * (x ^ 3) + theta.1[5] * (x ^ 4)

eta.2 = function(x, theta.2) 
    theta.2[1] + theta.2[2] * x + theta.2[3] * (x ^ 2)

eta <- list(eta.1, eta.2)

#List of fixed parameters
theta.1 <- c(1,1,1,1,1)
theta.2 <- c(1,1,1)
theta.fix <- list(theta.1, theta.2)

#Comparison table
p <- matrix(
    c(
        0, 1,
        0, 0
    ), c(length(eta), length(eta)), byrow = TRUE)

x <- seq(-1, 1, 0.1)
opt.1 <- list(method = 1, max.iter = 1)
opt.2 <- list(method = 1, max.iter = 2)
opt.3 <- list(method = 1)

res.1 <- tpopt(x = x, eta = eta, theta.fix = theta.fix, p = p, opt = opt.1)
res.2 <- tpopt(x = x, eta = eta, theta.fix = theta.fix, p = p, opt = opt.2)
res.3 <- tpopt(x = x, eta = eta, theta.fix = theta.fix, p = p, opt = opt.3)

plot(res.1)
plot(res.2)
plot(res.3)



