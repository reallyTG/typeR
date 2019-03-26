library(Runuran)


### Name: udweibull
### Title: UNU.RAN object for Weibull distribution
### Aliases: udweibull
### Keywords: distribution

### ** Examples

## Create distribution object for Weibull distribution
distr <- udweibull(shape=3)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




