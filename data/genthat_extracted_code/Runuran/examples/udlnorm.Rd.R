library(Runuran)


### Name: udlnorm
### Title: UNU.RAN object for Log Normal distribution
### Aliases: udlnorm
### Keywords: distribution

### ** Examples

## Create distribution object for log normal distribution
distr <- udlnorm()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




