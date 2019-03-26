library(PoweR)


### Name: checklaw
### Title: Check proper behaviour of a random generator
### Aliases: checklaw
### Keywords: utilities distribution

### ** Examples

dlaplace1 <- function(x, mu, b) {dexp(abs(x - mu), 1 / b) / 2}
checklaw(1, density = dlaplace1)
dlaplace2 <- function(x, pars) {dexp(abs(x - pars[1]), 1 / pars[2]) / 2}
checklaw(1, density = dlaplace2)


checklaw(law.index = 2, sample.size = 50000, law.pars = c(2, 3), density
= dnorm)

## We use the 'trunc' argument to display the density in a region where
## no extreme values are present.
checklaw(27, density = dlaw27, trunc = c(-Inf,10))

# This one (Tukey) does not have a closed form expression for
# the density. But we can use the stats::density() function as
# follows.
res <- checklaw(18)
lines(density(res$sample), col = "blue")



