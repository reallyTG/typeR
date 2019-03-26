library(Runuran)


### Name: udnorm
### Title: UNU.RAN object for Normal distribution
### Aliases: udnorm
### Keywords: distribution

### ** Examples

## Create distribution object for standard normal distribution
distr <- udnorm()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)

## Create distribution object for positive normal distribution
distr <- udnorm(lb=0, ub=Inf)
## ... and draw a sample
gen <- pinvd.new(distr)
x <- ur(gen,100)




