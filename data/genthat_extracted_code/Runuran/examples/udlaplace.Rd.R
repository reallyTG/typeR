library(Runuran)


### Name: udlaplace
### Title: UNU.RAN object for Laplace distribution
### Aliases: udlaplace
### Keywords: distribution

### ** Examples

## Create distribution object for standard Laplace distribution
distr <- udlaplace()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




