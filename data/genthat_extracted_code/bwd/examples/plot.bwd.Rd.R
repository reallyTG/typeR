library(bwd)


### Name: plot.bwd
### Title: plot for the backward procedure for the change point detection
### Aliases: plot.bwd

### ** Examples

# simulated data
set.seed(1)
n <- 1000
L <- 10

mu0 <- -0.5

mu <- rep(mu0, n)
mu[(n/2 + 1):(n/2 + L)] <- mu0 + 1.6
mu[(n/4 + 1):(n/4 + L)] <- mu0 - 1.6
y <- mu + rnorm(n)
alpha <- c(0.01, 0.05)

# BWD
obj1 <- bwd(y, alpha = alpha)

# Modified for epidemic changes with a known basline mean, mu0.
obj2 <- bwd(y, alpha = alpha, mu0 = 0)

par(mfrow = c(2,1))
plot(obj1, y)
plot(obj2, y)




