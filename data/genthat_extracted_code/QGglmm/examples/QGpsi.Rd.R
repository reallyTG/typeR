library(QGglmm)


### Name: QGpsi
### Title: Compute "Psi" (used to compute the additive genetic variance on
###   the observed scale).
### Aliases: QGpsi

### ** Examples

## Example using binom1.probit model
mu <- 0
va <- 1
vp <- 2
# The inverse-link for a probit is the CDF of a standard Gaussian
# Hence its derivative is the PDF of a standard Gaussian
dinv <- function(x){dnorm(x)}

# Computing Psi
Psi <- QGpsi(mu = 0, var = 2, d.link.inv = dinv)
# Computing additive variance on the observed scale
(Psi^2) * va

# This function is used by QGparams to obtain var.a.obs
QGparams(mu = 0, var.p = vp, var.a = va, model = "binom1.probit")
# Same results as above!



