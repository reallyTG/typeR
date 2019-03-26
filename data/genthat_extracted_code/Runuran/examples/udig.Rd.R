library(Runuran)


### Name: udig
### Title: UNU.RAN object for Inverse Gaussian distribution
### Aliases: udig
### Keywords: distribution

### ** Examples

## Create distribution object for inverse Gaussian distribution
distr <- udig(mu=3, lambda=2)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




