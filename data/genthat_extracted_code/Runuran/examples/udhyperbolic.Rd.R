library(Runuran)


### Name: udhyperbolic
### Title: UNU.RAN object for Hyperbolic distribution
### Aliases: udhyperbolic
### Keywords: distribution

### ** Examples

## Create distribution object for hyperbolic distribution
distr <- udhyperbolic(alpha=3,beta=2,delta=1,mu=0)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




