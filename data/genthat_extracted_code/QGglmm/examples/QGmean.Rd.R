library(QGglmm)


### Name: QGmean
### Title: Compute the phenotypic mean on the observed scale
### Aliases: QGmean

### ** Examples

## Computing the observed mean for a probit link
QGmean(mu = 0.3, var = 1, link.inv = pnorm)
# The theoretical expectation is
1 - pnorm(0, 0.3, sqrt(1 + 1))

# Or, using the QGlink.funcs function
QGmean(mu = 0.3, var = 1, link.inv = QGlink.funcs(name = "binom1.probit")$inv.link)

## Computing the observed mean for a logarithm link
QGmean(mu = 1, var = 1, link.inv = exp)
# The theoretical expectation is
exp(1 + 0.5 * 1)

# This computation is automatically performed by QGparams
# but directly using the closed form solution when available
QGparams(mu = 1, var.p = 1, var.a = 0.5, model = "Poisson.log")




