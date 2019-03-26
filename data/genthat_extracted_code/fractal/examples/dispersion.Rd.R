library(fractal)


### Name: dispersion
### Title: Dispersion analysis
### Aliases: dispersion
### Keywords: univar models nonlinear

### ** Examples

set.seed(100)
z <- dispersion(rnorm(1024))
plot(log(z$scale),log(z$sd))



