library(Runuran)


### Name: udghyp
### Title: UNU.RAN object for Generalized Hyperbolic distribution
### Aliases: udghyp
### Keywords: distribution

### ** Examples

## Create distribution object for generalized hyperbolic distribution
distr <- udghyp(lambda=-1.0024, alpha=39.6, beta=4.14, delta=0.0118, mu=-0.000158)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




