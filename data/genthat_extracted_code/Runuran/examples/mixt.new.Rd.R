library(Runuran)


### Name: mixt.new
### Title: UNU.RAN generator for finite mixture of distributions
### Aliases: mixt.new
### Keywords: datagen distribution

### ** Examples

## Create a mixture of an Exponential and a Half-normal distribution
unr1 <- unuran.new(udnorm(lb=-Inf, ub=0))
unr2 <- unuran.new(udexp())
mix <- mixt.new( c(1,1), c(unr1, unr2) )
x <- ur(mix,100)

## Now use inversion method:
## It is important that
##  1. we use a inversion for each component
##  2. the domains to not overlap
##  3. the components are ordered with respect to their domains
unr1 <- pinvd.new(udnorm(lb=-Inf, ub=0))
unr2 <- pinvd.new(udexp())
mix <- mixt.new( c(1,1), c(unr1, unr2), inversion=TRUE )
x <- ur(mix,100)

## We also can compute the inverse distribution function
##x <- uq(mix,0.90)

## Create a mixture of Exponential and Geometric distrbutions
unr1 <- unuran.new(udexp())
unr2 <- unuran.new(udgeom(0.7))
mix <- mixt.new( c(0.6,0.4), c(unr1, unr2) )
x <- ur(mix,100)




