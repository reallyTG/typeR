library(Runuran)


### Name: udgamma
### Title: UNU.RAN object for Gamma distribution
### Aliases: udgamma
### Keywords: distribution

### ** Examples

## Create distribution object for gamma distribution
distr <- udgamma(shape=4)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




