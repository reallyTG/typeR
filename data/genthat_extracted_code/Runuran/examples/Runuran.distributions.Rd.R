library(Runuran)


### Name: Runuran.distributions
### Title: UNU.RAN distribution objects
### Aliases: Runuran.distributions
### Keywords: distribution datagen

### ** Examples

## Create an object for a gamma distribution with shape parameter 5.
distr <- udgamma(shape=5)
## Create the UNU.RAN generator object. use method PINV (inversion).
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen, 100)
## Compute some quantiles for Monte Carlo methods
x <- uq(gen, (1:9)/10)

## Analogous for half normal distribution
distr <- udnorm(lb=0, ub=Inf)
gen <- pinvd.new(distr)
x <- ur(gen, 100)
x <- uq(gen, (1:9)/10)

## Analogous for a generalized hyperbolic distribution
distr <- udghyp(lambda=-1.0024, alpha=39.6, beta=4.14, delta=0.0118, mu=-0.000158)
gen <- pinvd.new(distr)
x <- ur(gen, 100)
x <- uq(gen, (1:9)/10)

## It is also possible to compute density or distribution functions.
## However, this might not work for all generator objects.
##    Density
x <- ud(gen, 1.2)
##    Cumulative distribution function
x <- up(gen, 1.2)




