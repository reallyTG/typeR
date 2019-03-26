library(kappalab)


### Name: rnd-methods
### Title: Rounding of set function coefficients
### Aliases: rnd rnd-methods rnd,superclass.set.func-method
### Keywords: methods

### ** Examples

## a capacity
mu <- capacity(0:15/15)
mu
rnd(mu,2)

## a similar example with a Mobius.capacity object
a <- Mobius(mu)
a
rnd(a,1)

## a similar example with a card.capacity object
mu <- uniform.capacity(6)
mu
rnd(mu)



