library(ev.trawl)


### Name: rlexceed
### Title: Simulation of extreme value path using latent trawl process.
###   Transformed marginals have scale parameter '1+kappa'.
### Aliases: rlexceed

### ** Examples

alpha <- 3
beta <- 2
kappa <- 0.95
rho <- 0.2
n.timestamps <- 200
times <- 1:n.timestamps

marg.dist <- "gamma"
n <- 1
transformation <- FALSE
trawl.function <- "exp"

rlexceed(alpha = alpha, beta = beta, kappa = kappa, rho = rho, times = times,
         marg.dist = marg.dist, n = n, transformation = transformation,
         trawl.function= trawl.function)




