library(Runuran)


### Name: udmeixner
### Title: UNU.RAN object for Meixner distribution
### Aliases: udmeixner
### Keywords: distribution

### ** Examples

## Create distribution object for meixner distribution
distr <- udmeixner(alpha=0.0298, beta=0.1271, delta=0.5729, mu=-0.0011)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




