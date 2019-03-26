library(Runuran)


### Name: ud
### Title: Density function for "unuran" object
### Aliases: ud

### ** Examples

## Create an UNU.RAN distribution object (for standard Gaussian)
## and evaluate density for some points
distr <- udnorm()
ud(distr, 1.5)
ud(distr, -3:3)

## Create an UNU.RAN generator object (for standard Gaussian)
## and evaluate density of underyling distribution
gen <- tdrd.new(udnorm())
ud(gen, 1.5)
ud(gen, -3:3)




