library(Runuran)


### Name: udslash
### Title: UNU.RAN object for Slash distribution
### Aliases: udslash
### Keywords: distribution

### ** Examples

## Create distribution object for a slash distribution
distr <- udslash()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




