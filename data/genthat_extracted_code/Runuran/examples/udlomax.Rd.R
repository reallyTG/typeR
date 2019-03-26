library(Runuran)


### Name: udlomax
### Title: UNU.RAN object for Lomax distribution
### Aliases: udlomax
### Keywords: distribution

### ** Examples

## Create distribution object for Lomax distribution
distr <- udlomax(shape=2)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




