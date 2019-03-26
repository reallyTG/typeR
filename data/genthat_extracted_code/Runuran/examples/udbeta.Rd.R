library(Runuran)


### Name: udbeta
### Title: UNU.RAN object for Beta distribution
### Aliases: udbeta
### Keywords: distribution

### ** Examples

## Create distribution object for beta distribution
distr <- udbeta(shape1=3,shape2=7)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




