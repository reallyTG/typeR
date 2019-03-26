library(Runuran)


### Name: udvg
### Title: UNU.RAN object for Variance Gamma distribution
### Aliases: udvg
### Keywords: distribution

### ** Examples

## Create distribution object for variance gamma distribution
distr <- udvg(lambda=2.25, alpha=210.5, beta=-5.14, mu=0.00094)
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)



