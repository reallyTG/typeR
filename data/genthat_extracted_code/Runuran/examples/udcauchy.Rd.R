library(Runuran)


### Name: udcauchy
### Title: UNU.RAN object for Cauchy distribution
### Aliases: udcauchy
### Keywords: distribution

### ** Examples

## Create distribution object for Cauchy distribution
distr <- udcauchy()
## Generate generator object; use method PINV (inversion)
gen <- pinvd.new(distr)
## Draw a sample of size 100
x <- ur(gen,100)




