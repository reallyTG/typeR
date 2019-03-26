library(msde)


### Name: sde.drift
### Title: SDE drift function.
### Aliases: sde.drift

### ** Examples

# load Heston's model
hmod <- sde.examples("hest")

# single input
x0 <- c(X = log(1000), Z = 0.1)
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
sde.drift(model = hmod, x = x0, theta = theta)

# multiple inputs
nreps <- 10
Theta <- apply(t(replicate(nreps,theta)),2,jitter)
X0 <- apply(t(replicate(nreps,x0)),2,jitter)
sde.drift(model = hmod, x = X0, theta = Theta)



