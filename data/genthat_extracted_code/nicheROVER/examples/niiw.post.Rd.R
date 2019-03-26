library(nicheROVER)


### Name: niiw.post
### Title: Random draws from the posterior distribution with
###   Normal-Independent-Inverse-Wishart (NIIW) prior.
### Aliases: niiw.post

### ** Examples

# simulate data
d <- 4
mu0 <- rnorm(d)
Sigma0 <- matrix(rnorm(d^2), d, d)
Sigma0 <- Sigma0 %*% t(Sigma0)
N <- 100
X <- rmvnorm(N, mean = mu0, sigma = Sigma0)

# prior parameters
# flat prior on mu
lambda <- 0
Omega <- 0
# informative prior on Sigma
Psi <- crossprod(matrix(rnorm(d^2), d, d))
nu <- 5

# sample from NIIW posterior
nsamples <- 2e3
system.time({
 siiw <- niiw.post(nsamples, X, lambda, Omega, Psi, nu, burn = 100)
})

# sample from NIW posterior
kappa <- 0
system.time({
 siw <- niw.post(nsamples, X, lambda, kappa, Psi, nu)
})

# check that posteriors are the same

# p(mu | X)
clrs <- c("black", "red")
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(list(siiw, siw), col = clrs, plot.mu = TRUE, plot.Sigma = FALSE)
legend(x = "topright", legend = c("NIIW Prior", "NIW Prior"), fill = clrs)

# p(Sigma | X)
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(list(siiw, siw), col = clrs, plot.mu = FALSE, plot.Sigma = TRUE)
legend(x = "topright", legend = c("NIIW Prior", "NIW Prior"), fill = clrs)



