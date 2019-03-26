library(nicheROVER)


### Name: niw.coeffs
### Title: Posterior coefficients of the Normal-Inverse-Wishart
###   distribution with its conjugate prior.
### Aliases: niw.coeffs

### ** Examples

# NIW prior coefficients
d <- 3
lambda <- rnorm(d)
kappa <- 5
Psi <- crossprod(matrix(rnorm(d^2), d, d))
nu <- 10

# data
data(fish)
X <- fish[fish$species == "ARCS",2:4]

# NIW posterior coefficients
post.coef <- niw.coeffs(X, lambda, kappa, Psi, nu)

# compare
mu.mean <- niw.mom(post.coef$lambda, post.coef$kappa, post.coef$Psi, post.coef$nu)$mu$mean
mu.est <- rbind(prior = niw.mom(lambda, kappa, Psi, nu)$mu$mean,
               data = colMeans(X),
               post = mu.mean)
round(mu.est, 2)



