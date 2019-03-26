library(msde)


### Name: sde.prior
### Title: SDE prior function.
### Aliases: sde.prior

### ** Examples

hmod <- sde.examples("hest") # load Heston's model

# setting prior for 3 parameters
rv.names <- c("alpha","gamma","rho")
mu <- rnorm(3)
Sigma <- crossprod(matrix(rnorm(9),3,3))
names(mu) <- rv.names
colnames(Sigma) <- rv.names
rownames(Sigma) <- rv.names
hyper <- list(mu = mu, Sigma = Sigma)

# Simulate data
nreps <- 10
theta <- c(alpha = 0.1, gamma = 1, beta = 0.8, sigma = 0.6, rho = -0.8)
x0 <- c(X = log(1000), Z = 0.1)
Theta <- apply(t(replicate(nreps,theta)),2,jitter)
X0 <- apply(t(replicate(nreps,x0)),2,jitter)

sde.prior(model = hmod, x = X0, theta = Theta, hyper = hyper)



