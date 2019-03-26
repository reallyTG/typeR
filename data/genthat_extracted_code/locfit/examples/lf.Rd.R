library(locfit)


### Name: lf
### Title: Locfit term in Additive Model formula
### Aliases: lf
### Keywords: models

### ** Examples

# fit an additive semiparametric model to the ethanol data.
stopifnot(require(gam))
# The `gam' package must be attached _before_ `locfit', otherwise
# the following will not work.
data(ethanol, package = "lattice")
fit <- gam(NOx ~ lf(E) + C, data=ethanol)
op <- par(mfrow=c(2, 1))
plot(fit)
par(op)



