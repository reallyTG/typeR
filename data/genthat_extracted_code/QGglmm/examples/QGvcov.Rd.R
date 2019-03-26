library(QGglmm)


### Name: QGvcov
### Title: Compute the phenotypic variance-covariance matrix on the
###   observed / expected scale
### Aliases: QGvcov

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

# Setting up the distribution variance functions
var.funcs <- function(mat) {matrix(c(pnorm(mat[1, ]) * (1 - pnorm(mat[1, ])), 0 * mat[2, ]),
                                   nrow = 2, 
                                   byrow = TRUE)}
# The first row is p * (1 - p) (variance of a binomial)
# The second row is 0 because no extra distribution is assumed for a Gaussian trait

# Computing the multivariate mean on observed scale
# Phenotypic VCV matrix on observed scale
QGvcov(mu = mu, vcov = P, link.inv = inv.links, var.func = var.funcs) 
# Phenotypic VCV matrix on the expected scale
QGvcov(mu = mu, vcov = P, link.inv = inv.links, var.func = var.funcs, exp.scale = TRUE) 

QGvar.exp(mu = 0, var = 1, link.inv = pnorm) # Same variance on the expected scale
QGvar.exp(mu = 0, var = 1, link.inv = pnorm) +
    QGvar.dist(mu = 0, var = 1, var.func = function(x){pnorm(x) * (1 - pnorm(x))})
# Same variance on the observed scale
# Reminder: the results are the same here because we have no correlation between the two traits



