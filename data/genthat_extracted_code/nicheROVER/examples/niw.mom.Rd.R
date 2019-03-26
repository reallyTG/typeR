library(nicheROVER)


### Name: niw.mom
### Title: Mean and variance of the Normal-Inverse-Wishart distribution.
### Aliases: niw.mom

### ** Examples

# NIW parameters
d <- 3 # number of dimensions
lambda <- rnorm(d)
kappa <- 2
Psi <- crossprod(matrix(rnorm(d^2), d, d))
nu <- 10

# simulate data
niw.sim <- rniw(n = 1e4, lambda, kappa, Psi, nu)

# check moments
niw.mV <- niw.mom(lambda, kappa, Psi, nu)

# mean of mu
ii <- 1
c(true = niw.mV$mu$mean[ii], sim = mean(niw.sim$mu[,ii]))

# variance of Sigma
II <- c(1,2)
JJ <- c(2,3)
c(true = niw.mV$var[II[1],II[2],JJ[1],JJ[2]],
 sim = cov(niw.sim$Sigma[II[1],II[2],], niw.sim$Sigma[JJ[1],JJ[2],]))



