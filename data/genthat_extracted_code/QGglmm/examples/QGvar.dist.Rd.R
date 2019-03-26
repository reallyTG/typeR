library(QGglmm)


### Name: QGvar.dist
### Title: Compute the distribution variance
### Aliases: QGvar.dist

### ** Examples

## Example using Poisson.log model
mu <- 1
va <- 0.2
vp <- 0.5

# The variance function is simply the inverse-link function
# because the variance of a Poisson is its mean
varfunc <- function(x) { exp(x) }

QGvar.dist(mu = mu, var = vp, var.func = varfunc)

# The QGlink.funcs gives a ready - to - use var.func
funcs <- QGlink.funcs(name = "Poisson.log")

# Calculating the distribution variance
vdist <- QGvar.dist(mu = mu, var = vp, var.func = funcs$var.func)

vdist           # Same value as above

# Calculating the variance of the expected values
vexp <- QGvar.exp(mu = mu, var = vp, link.inv = funcs$inv.link)

# The phenotypic variance on the observed scale is then:
vexp + vdist

# This computation is automatically performed by QGparams
# but directly using the closed form solutions when available
QGparams(mu = mu, var.p = vp, var.a = va, model = "Poisson.log")
# var.obs is equal to the sum above



