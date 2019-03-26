library(Runuran)


### Name: udpowerexp
### Title: UNU.RAN object for Powerexponential distribution
### Aliases: udpowerexp
### Keywords: distribution

### ** Examples

## Create distribution object for powerexponential distribution
distr <- udpowerexp(shape=4)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




