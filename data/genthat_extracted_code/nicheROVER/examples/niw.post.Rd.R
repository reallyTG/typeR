library(nicheROVER)


### Name: niw.post
### Title: Random draws from the posterior distribution with
###   Normal-Inverse-Wishart (NIW) prior.
### Aliases: niw.post

### ** Examples

# compare the default non-informative prior to an arbitrary informative prior
# for simulated data

# simulate data
d <- 4
mu0 <- rnorm(d)
Sigma0 <- matrix(rnorm(d^2), d, d)
Sigma0 <- Sigma0 %*% t(Sigma0)
N <- 1e2
X <- rmvnorm(N, mean = mu0, sigma = Sigma0)

# informative prior parameters
lambda <- rnorm(d)
kappa <- 20
Psi <- crossprod(matrix(rnorm(d^2), d, d))
nu <- 5

# iid draws from informative prior pi(mu, Sigma)
nsamples <- 2e3
siw0 <- rniw(nsamples, lambda, kappa, Psi, nu)

# iid draws from posterior p(mu, Sigma | X) with informative prior
siw1 <- niw.post(nsamples, X, lambda, kappa, Psi, nu)

# iid draws from posterior p(mu, Sigma | X) with default noninformative prior
siw2 <- niw.post(nsamples, X)

# compare

# prior and posterior densities of mu
clrs <- c("orange", "red", "blue", "black")
ii <- 1
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(list(siw0, siw1, siw2), col = clrs[1:3],
              plot.index = ii, ylab = "Density")
abline(v = mu0[ii], col = clrs[4]) # true value of mu
legend(x = "topright",
      legend = c(parse(text = paste0("pi(mu[", ii, "])")),
                 parse(text = paste0("p(mu[", ii, "]*\" | \"*X)*\", Informative Prior\"")),
                 parse(text = paste0("p(mu[", ii, "]*\" | \"*X)*\", Noninformative Prior\"")),
                 parse(text = paste0("\"True value of \"*mu[", ii, "]"))),
      fill = clrs)

# prior and posterior densities of Sigma
ii <- 1
jj <- 2
par(mar = c(4.2, 4.2, 2, 1)+.1)
niche.par.plot(list(siw0, siw1, siw2), col = clrs[1:3],
              plot.index = c(ii,jj), ylab = "Density")
abline(v = Sigma0[ii,jj], col = clrs[4])
legend(x = "topright",
      legend = c(parse(text = paste0("pi(Sigma[", ii, "*", jj, "])")),
                 parse(text = paste0("p(Sigma[", ii, "*", jj,
                                     "]*\" | \"*X)*\", Informative Prior\"")),
                 parse(text = paste0("p(Sigma[", ii, "*", jj,
                                     "]*\" | \"*X)*\", Noninformative Prior\"")),
                 parse(text = paste0("\"True value of \"*Sigma[", ii, "*", jj, "]"))),
      fill = clrs)



