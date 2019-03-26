library(QGglmm)


### Name: QGmvmean
### Title: Compute the multivariate phenotypic mean on the observed scale
### Aliases: QGmvmean

### ** Examples

## Example using a bivariate model (Binary trait/Gaussian trait)
# Parameters
mu <- c(0, 1)
P <- diag(c(1, 4))

# Note: no phenotypic, nor genetic correlations, hence should be equal to univariate case!

# Setting up the link functions
# Note that since the use of "cubature" to compute the integrals,
# the functions must use a matrix as input and yield a matrix as output,
# each row corresponding to a trait
inv.links <- function(mat) {matrix(c(pnorm(mat[1, ]), mat[2, ]), nrow = 2, byrow = TRUE)}
# probit link and identity link respectively

# Computing the multivariate mean on observed scale
QGmvmean(mu = mu, vcov = P, link.inv = inv.links)
QGmean(mu = 0, var = 1, link.inv = pnorm)     # Same result than trait 1!
QGmean(mu = 1, var = 4, link.inv = function(x){x})     # Same result than trait 2!
# Reminder: the results are the same here because we have no correlation between the two traits



