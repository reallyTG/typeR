library(QGglmm)


### Name: QGmvpsi
### Title: Compute a multivariate "Psi" (used to compute the additive
###   genetic variance on the observed scale).
### Aliases: QGmvpsi

### ** Examples

## Example using a bivariate model (Binary trait/Gaussian trait)
# Parameters
mu <- c(0, 1)
G <- diag(c(0.5, 2))
P <- diag(c(1, 4))

# Setting up the derivatives of the inverse-link functions
dinvs <- function(mat) {matrix(c(dnorm(mat[1, ]), rep(1, length(mat[2, ]))),
                               nrow = 2, 
                               byrow = TRUE)}
# The derivative of pnorm() is dnorm(), and the derivative of the identity is 1

# Computing Psi
Psi <- QGmvpsi(mu = mu, vcov = P, d.link.inv = dinvs)
# Computing genetic additive variance-covariance matrix on the observed scale
Psi
G.obs <- Psi %*% G %*% t(Psi)

QGparams(mu = 0, var.a = 0.5, var.p = 1, model = "binom1.probit")
# Same additive variance than trait 1
# Reminder: the results are the same here because we have no correlation between the two traits



