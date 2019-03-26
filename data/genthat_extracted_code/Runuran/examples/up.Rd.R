library(Runuran)


### Name: up
### Title: Distribution function for "unuran" object
### Aliases: up

### ** Examples

## Create an UNU.RAN distribution object (for standard Gaussian)
## and evaluate distribution function for some points
distr <- udnorm()
up(distr, 1.5)
up(distr, -3:3)

## Create an UNU.RAN generator object (for standard Gaussian)
## and evaluate distribution function of underyling distribution
unr <- tdrd.new(udnorm())
up(unr, 1.5)
up(unr, -3:3)

## Create an UNU.RAN generator object that does not contain
## the CDF but implements method PINV.
unr <- pinv.new(pdf=function(x){exp(-x)}, lb=0,ub=Inf)
up(unr, 0:5)




