library(Runuran)


### Name: udexp
### Title: UNU.RAN object for Exponential distribution
### Aliases: udexp
### Keywords: distribution

### ** Examples

## Create distribution object for standard exponential distribution
distr <- udexp()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




