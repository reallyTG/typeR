library(msde)


### Name: sde.diff
### Title: SDE diffusion function.
### Aliases: sde.diff

### ** Examples

# load Heston's model
hmod <- sde.examples("hest")

# single input
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
x0 <- c(X = log(1000), Z = 0.1)
sde.diff(model = hmod, x = x0, theta = theta)

# multiple inputs
nreps <- 10
Theta <- apply(t(replicate(nreps, theta)), 2, jitter)
X0 <- apply(t(replicate(nreps, x0)), 2, jitter)
sde.diff(model = hmod, x = X0, theta = Theta)

# mixed inputs
sde.diff(model = hmod, x = x0, theta = Theta)



