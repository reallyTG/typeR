library(Runuran)


### Name: udfrechet
### Title: UNU.RAN object for Frechet distribution
### Aliases: udfrechet
### Keywords: distribution

### ** Examples

## Create distribution object for Frechet distribution
distr <- udfrechet(shape=2)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




