library(Runuran)


### Name: udrayleigh
### Title: UNU.RAN object for Rayleigh distribution
### Aliases: udrayleigh
### Keywords: distribution

### ** Examples

## Create distribution object for standard Rayleigh distribution
distr <- udrayleigh()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




