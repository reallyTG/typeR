library(QGglmm)


### Name: QGvar.exp
### Title: Compute the variance of expected values (i.e. the latent values
###   after inverse-link transformation.)
### Aliases: QGvar.exp

### ** Examples

## Example using Poisson.log model
mu <- 1
va <- 0.2
vp <- 0.5

# The inverse-link for a logarithm link is the exponential
inv.link<- function(x){exp(x)}

# We can then calculate the variance of expected values
QGvar.exp(mu = mu, var = vp, link.inv = inv.link)

# The mean on the observed scale can be computed beforehand
y_bar <- QGmean(mu = mu, var = vp, link.inv = inv.link)
QGvar.exp(mu = mu, var = vp, obs.mean = y_bar, link.inv = inv.link)

# The QGlink.funcs gives a ready - to - use inverse-link function
funcs<- QGlink.funcs(name = "Poisson.log")

# Calculating the distribution variance
vexp <- QGvar.exp(mu = mu, var = vp, obs.mean = y_bar, link.inv = funcs$var.func)

vexp           # Same value as above

# Calculating the associated distribution variance
vdist <- QGvar.dist(mu = mu, var = vp, var.func = funcs$var.func)

# The phenotypic variance on the observed scale is then:
vexp + vdist

# This computation is automatically performed by QGparams
# but directly using the closed form solutions when available
QGparams(mu = mu, var.p = vp, var.a = va, model = "Poisson.log")
# var.obs is equal to the sum above



