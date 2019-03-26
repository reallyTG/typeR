library(Runuran)


### Name: udgig
### Title: UNU.RAN object for Generalized Inverse Gaussian distribution
### Aliases: udgig udgiga
### Keywords: distribution

### ** Examples

## Create distribution object for GIG distribution
distr <- udgig(theta=3, psi=1, chi=1)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




